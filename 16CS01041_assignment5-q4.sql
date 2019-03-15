-- Drop tables
drop table student;
drop table course;
drop table attendance;

-- Set environment
set lines 256
set trimout on
set tab off
set pagesize 200
set colsep "| "
column name format a10
column address format a20
column telephone format 9999999999
set serverout on

-- create tables
create table student(
	sroll int not null,
 	name varchar(30) not null,
 	branch varchar(30) not null,
 	batch int not null,
 	programme varchar(20) not null
);

create table course(
	cid varchar(10) not null,
	cname varchar(30) not null,
	teacher varchar(30) not null
);

create table attendance(
	sroll int not null,
	course_id varchar(10) not null,
	period varchar(20),
	total int not null,
	percent int not null
);

-- Inserting values
insert into student values('1', 'Madhav', 'CSE', '2016', 'B.Tech');
insert into student values('2', 'Preetham', 'CSE', '2016', 'B.Tech');
insert into student values('3', 'Venu', 'CSE', '2017', 'B.Tech');

insert into course values('cs1', 'Algorithms', 'Joy');
insert into course values('cs2', 'Data structures', 'Joy');
insert into course values('cs3', 'Networks', 'Sudipta');
insert into course values('cs1', 'Database', 'Bera');

insert into attendance values('1', 'cs1', 'NULL', '3', '90');
insert into attendance values('2', 'cs1', 'NULL', '3', '60');
insert into attendance values('3', 'cs1', 'NULL', '3', '80');
insert into attendance values('1', 'cs2', 'NULL', '3', '50');

-- 1)
select s.name 
from student s,attendance a 
where a.sroll=s.sroll and a.percent<80 and a.course_id=&cid;

-- 2)
create or replace view v2 
as 
select s.sroll, s.name, a.course_id, a.percent 
from student s,attendance a 
where a.sroll=s.sroll and s.batch=&batch;

select * from v2;

-- 3)
select sroll,name from v2 where percent<70;

-- 4)
create or replace view v4 
as 
select sroll, percent 
from attendance a 
where course_id=&cid;

select * from v4;

-- 5)
update v4 set percent=&new where sroll=&roll;
select * from attendance;

-- 6)
create or replace trigger deregister after delete on student for each row
declare
begin
	delete from attendance where sroll = :old.sroll;
end;
/

select * from attendance;
delete from student where sroll='3';
select * from attendance;

-- 7)
create or replace function calTA(roll in attendance.sroll%type, cid in attendance.course_id%type)
return int
as marks int;
begin
	select percent into marks from attendance where sroll=roll and course_id=cid;

	if(marks>=95) then
		marks:=5;
	elsif(marks>85) then
		marks:=4;
	elsif(marks>75) then
		marks:=3;
	elsif(marks>60) then
		marks:=2;
	else marks:=2;
	end if;

	return marks;

end calTA;
/