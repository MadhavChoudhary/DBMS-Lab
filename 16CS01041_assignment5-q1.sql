-- Drop tables
drop table student;
drop table course;
drop table prerequisite;
drop table registration;
drop table grades;
drop table attendance;
drop table attendance_warning;
drop table deregistration


-- Create Tables
create table student(roll varchar (20), name varchar (20), department varchar(20), batch varchar (20), email varchar (20));
create table course (courseno varchar(20), cname varchar(50), dept_offering varchar (20), semester_no number(1), course_type varchar (20), credit number (3));
create table prerequisite(courseno varchar(20),prcourseno varchar (20));
create table registration (roll varchar(20),courseno varchar (20), semester_no number(1));
create table grades (roll varchar (20), courseno varchar(20), grades number (6,3));
create table attendance (courseno varchar (20), roll varchar (20), dates date, status varchar(20));
create table attendance_warning (roll varchar (20), courseno varchar (20));
create table deregistration (roll varchar(20), courseno varchar(20), dates_absent date);

-- Adding constraints
alter table course add constraint sem_constraint check (semester_no between 1 and 8);
alter table grades add constraint grade_constraint check (grades between 5 and 10);
alter table attendance add constraint status_constraint check (status in ('p','a'));
alter table course add constraint type_constraint check (course_type in ('core-theory','elective','core-lab'));
create sequence students_seq start with 1 increment by 1;
create sequence courses_seq start with 1 increment by 1;
alter table student add primary key (roll);
alter table student add constraint u_t unique(email);
alter table course add primary key (courseno);
alter table grades add primary key (roll,courseno);
alter table registration add primary key (roll,courseno);
alter table prerequisite add primary key (courseno,prcourseno);
alter table attendance add primary key (roll,courseno, dates_absent);

-- Inserting values
insert into student values (students_seq.nextval,'aditya pal','cse','2016-2020','ap37@iitbbs.ac.in');
insert into student values (students_seq.nextval,'madhav tummala','cse','2016-2020','tm15@iitbbs.ac.in');
insert into student values (students_seq.nextval,'saksham arneja','cse','2016-2020','sa26@iitbbs.ac.in');
insert into student values (students_seq.nextval,'chirag nighut','ece','2016-2020','nca10@iitbbs.ac.in');
insert into student values (students_seq.nextval,'pranjal bangani','mm','2015-2019','pb16@iitbbs.ac.in');
insert into student values (students_seq.nextval,'prathyush n p','cse','2016-2020','pnp10@iitbbs.ac.in');
insert into student values (students_seq.nextval,'gaurav gupta','cse','2017-2021','gg13@iitbbs.ac.in');

insert into course values (courses_seq.nextval,'formal language and automata theory','cse',5,'core-theory',4);
insert into course values (courses_seq.nextval,'database management','cse',6,'core-theory',4);
insert into course values (courses_seq.nextval,'signals and systems','ece',5,'elective',3);
insert into course values (courses_seq.nextval,'combinatorics, probability and statistics','mat',4,'core-theory',4);

insert into grades values ('1', '1', 9.70);
insert into grades values ('3', '1', 9.78);
insert into grades values ('3', '3', 9.25);
insert into grades values ('7', '1', 8.25);
insert into grades values ('2', '1', 8.05);
insert into grades values ('2', '2', 9.15);
insert into grades values ('2', '3', 9.13);

--1)
create or replace trigger coursenumcheck before insert on registration for each row
declare
	num int(10) default 0;
begin
	select count(*) into num from registration where roll=:new.roll group by :new.roll;
	--dbms_output.put_line(num);
	if num=6 then 
		raise_application_error(-20003,'sorry, you can only register for 6 courses max.');
	end if;
exception
	when no_data_found then
		dbms_output.put_line('first entry');
end;
/

create or replace trigger creditcheck before insert on registration for each row
declare
	num int(10) default 0;
	val varchar(20);
	credits int (10);
	courses varchar(20);
	cursor cur_list is select courseno from registration where roll=:new.roll;
begin
	open cur_list;
	loop
		exit when cur_list%notfound;
		fetch cur_list into courses;
		select credit into val from course where courseno=courses;
		num:=num+val;
	end loop;
	close cur_list;
	--select credit into val from course where courseno=:new.courseno;
	--num:=num+val;
	dbms_output.put_line('current credits: '||num);
	if num>24 then
		raise_application_error(-20004,'sorry, only 24 credits max');
	end if;
exception
	when no_data_found then
		dbms_output.put_line('first entry');
end;
/

create or replace trigger corecoursecheck before insert on registration for each row
declare
	num int(10) default 0;
	val varchar(20);
	credits int (10);
	courses varchar(20);
	cursor cur_list is select prcourseno from prerequisite where courseno=:new.courseno;
begin
	open cur_list;
	select course_type into courses from course where courseno=:new.courseno;
	if courses!='core-theory' and courses!='core-lab' then
		goto jump;
	end if;
	loop
		exit when cur_list%notfound;
		fetch cur_list into courses;
		select grades into val from grades where courseno=courses and roll=:new.roll;
		if val<6 then
			num:=1;
			goto jump;
		end if;
	end loop;
	<<jump>>
	close cur_list;
	if num=1 then
		raise_application_error(-20005,'sorry, you do not meet the pre-requisites for this course');
	end if;
exception
	when no_data_found then
		dbms_output.put_line('first entry');
end;
/

create or replace trigger electivecoursecheck before insert on registration for each row
declare
	val varchar(20);
	courses varchar(20);
	cursor cur_list is select prcourseno from prerequisite where courseno=:new.courseno;
begin
	open cur_list;
	select course_type into courses from course where courseno=:new.courseno;
	if courses!='elective' then
		goto jump;
	end if;
	loop
		begin
		exit when cur_list%notfound;
		fetch cur_list into courses;
		select courseno into val from registration where roll=:new.roll and courseno=courses;--will give 'not-found' error if pre-requisite is missing, so handle it
		exception
			when no_data_found then
				raise_application_error(-20006,'sorry, please register for all pre-requisites first');
		end;
	end loop;
	<<jump>>
	close cur_list;
exception
	when no_data_found then--outer exception
		dbms_output.put_line('no pre-requisite');
end;
/


--b)
create or replace trigger attendancewarning before insert on attendance for each row
declare
	num number(3) default 0;
	courses varchar(20);
	days number (3);
	cursor cur_list is select status from attendance where roll=:new.roll and courseno=:new.courseno;
begin
	open cur_list;
	select count(status) into days from attendance where roll=:new.roll and courseno=:new.courseno;
	if mod(days,5)!=0 or days=0 then
		goto jump;
	end if;
	loop
		exit when cur_list%notfound;
		fetch cur_list into courses;
		if courses='p' then
			num:=num+1;
		end if;
	end loop;
	if num/days<0.8 then
		insert into attendance_warning values (:new.roll,:new.courseno);
	end if;
	<<jump>>
	close cur_list;
exception
	when no_data_found then
		dbms_output.put_line('first entry');
end;
/

create or replace trigger deregistrationnotice before insert on attendance_warning for each row
declare
	--pragma autonomous_transaction;
	num number(3) default 0;
begin
	select count(courseno) into num from attendance_warning where roll=:new.roll and courseno=:new.courseno; 
	dbms_output.put_line(num);
	if num>=1 then
		insert into deregistration values (:new.roll,:new.courseno,sysdate);
		delete from registration where roll=:new.roll and courseno=:new.courseno;
	end if;
exception
	when no_data_found then
		dbms_output.put_line('first entry');
end;
/

--c)
select avg(grades) as average_grade, name, semester_no from student, grades, course where student.roll=grades.roll and grades.courseno=course.courseno group by student.roll,semester_no, name; 

--d)
select max(average_grade), batch from (select avg(grades) as average_grade, name, batch, semester_no from student, grades, course where student.roll=grades.roll and grades.courseno=course.courseno group by student.roll,batch,semester_no, name) group by batch;

--e)
create table t1 as select sum(grades*credit) as net_grade, roll from grades,course where grades.courseno=course.courseno group by roll;
create table t2 as select sum(credit) as net_credit, roll from grades,course where grades.courseno=course.courseno group by roll;
create table t3 as select  net_grade, net_credit, net_grade/net_credit as cgpa from t1,t2 where t1.roll=t2.roll;
select * from t3;
drop table t1;
drop table t2;
drop table t3;

--f)
select roll, batch from student s where ((select avg(grades) as degreegrade from grades where roll=s.roll), batch) in (select max(degreegrade), batch from student, (select avg(grades) as degreegrade, roll from grades group by roll) temp where student.roll=temp.roll group by batch);

--g)
select count(roll), department from student where batch=&batch and roll in (select roll from (select avg(grades) as degreegrade, roll from grades group by roll) where degreegrade>9) group by department;

--h)
create view crse as select cname from course;
select * from course;
select * from crse;
update crse set cname='dbms' where cname='database management';
select  * from course;