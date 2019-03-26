drop table broadcast;
drop table requests;
drop table st;
drop sequence Req;

set lines 256
set trimout on
set tab off
set pagesize 200
set colsep "| "
column name format a10
column address format a20
column telephone format 9999999999
set serverout on

create sequence Req start with 1 increment by 1;

create table requests(
	src_node number,
	dst_node number,
	reqno number,
	src_interface number
);

create table broadcast(
	reqno number,
	src_node number,
	dst_node number,
	t timestamp	
);

create table st(
	node number,
	interface number
);

create or replace trigger onrequest after insert on requests for each row
declare
	n number;
	dst_interface number;
	t timestamp;
begin
	select count(*) into n from st where node=:new.src_node;

	if(n=0) then
		insert into st values(:new.src_node,:new.src_interface);
	end if;

	select count(*) into n from st where node=:new.dst_node;

	if(n=0) then
		select current_timestamp into t from dual;
		insert into broadcast values(:new.reqno,:new.src_node,:new.dst_node,t);
		dbms_output.put_line('Missed');
	else
		select interface into dst_interface from st where node=:new.dst_node;
		dbms_output.put_line(:new.reqno || ' , ' || :new.src_node || ' forwarded to ' || dst_interface);
	end if;

end;
/

declare
	count1 number;
	count2 number;
begin
	insert into requests values('1', '2', Req.nextval, '5');
	insert into requests values('3', '2', Req.nextval, '4');
	insert into requests values('4', '3', Req.nextval, '2');
	insert into requests values('2', '1', Req.nextval, '6');
	insert into requests values('5', '6', Req.nextval, '3');
	insert into requests values('6', '5', Req.nextval, '1');

	select count(*) into count1 from broadcast;
	dbms_output.put_line('Misfires ' || (count1));
	dbms_output.new_line();
	
	insert into requests values('1', '2', Req.nextval, '5');
	insert into requests values('3', '2', Req.nextval, '4');
	insert into requests values('4', '3', Req.nextval, '2');
	insert into requests values('2', '1', Req.nextval, '6');
	insert into requests values('5', '6', Req.nextval, '3');
	insert into requests values('6', '5', Req.nextval, '1');

	select count(*) into count2 from broadcast;
	dbms_output.put_line('Misfires '|| (count2-count1));
end;
/