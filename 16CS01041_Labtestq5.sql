-- create database labtest5;
-- use labtest5;

drop table graph;
drop view view1;
drop table mstset;
drop table edges;

set lines 256
set trimout on
set tab off
set pagesize 200
set colsep "| "
column name format a10
column address format a20
column telephone format 9999999999
set serverout on

create table graph(
	p int,
	q int,
	c int
);

create table mstset(
	vertex int,
	status int
);

create table edges(
	p int,
	q int,
	w int
);

insert into graph values('1','2','1');
insert into graph values('2','3','1');
insert into graph values('3','4','1');
insert into graph values('1','4','2');

-- insert into graph select q as p,p as q,c as c from graph;

-- create or replace view view1 as select p, count(*) as cnt from graph group by p;

-- select * from view1;

-- select p as vertex from view1 where cnt=(select max(cnt) from view1);
-- select p as vertex from view1 where cnt=(select min(cnt) from view1);

-- select g1.p as p, g2.p as q, g2.q as r from graph g1,graph g2 where g1.q=g2.p and g1.c+g2.c<10;

-- declare
--     n number;
--     e number;
-- begin
-- 	select count(*),sum(cnt) into n,e from view1;

-- 	if((n-1)=(e/2)) then
-- 		dbms_output.put_line('Is a Tree');
-- 	else
-- 		dbms_output.put_line('Not a Tree');
-- 	end if;
-- end;
-- /

declare
	src int;
	temp_p int;
	temp_q int;
	temp_w int;
	cnt int;
	temp_cnt int;
	c int;
	e int;
begin
	src:=1;
	c:=0;

	insert into mstset select distinct p,0 from graph;
	insert into mstset select distinct q,0 from graph;

	select count(distinct vertex) into cnt from mstset;

	loop
		update mstset set status=1 where vertex=src;
		select count(distinct vertex) into temp_cnt from mstset where status=1;

		exit when temp_cnt=cnt;

		insert into edges select p,q,c from graph where p=src;
		select * into temp_p,temp_q,temp_w from edges where w = (select min(w) from edges) and rownum<=1;

		dbms_output.put_line( 'Selected Edge: ' || (temp_p) || ' ' || (temp_q) || ' ' || (temp_w) );

		delete from edges where q=temp_q;

		src := temp_q;
		c := c+1;

	end loop;

	select count(*) into e from graph;

	if(c=e) then 
		dbms_output.put_line('Is a Tree');
	else	 
		dbms_output.put_line('Not a Tree');
	end if;

end;
/