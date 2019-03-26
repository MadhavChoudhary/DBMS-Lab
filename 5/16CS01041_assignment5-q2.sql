-- drop tables
drop table emp;
drop table dept;
drop table manpower_budget;
drop table salary_hike;
drop table employee_history;

-- set environment
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
create table emp(
	eno int not null,
 	ename varchar(30) not null,
 	sal int not null,
 	comm varchar(30),
 	dept_no int not null,
 	job_type varchar (20) not null,
	joining_date date not null
);

create table dept(
	dno int not null,
	dname varchar(30) not null,
	location varchar(30) not null,
	dmgrno int not null
);

create table manpower_budget(
	dno int not null,
	year int not null,
	cost int not null
);

create table salary_hike(
	eno int not null,
	ename varchar (30) not null,
	increment_date date not null,
	amount int not null	
);

create table employee_history(
	eno int not null,
 	ename varchar(30) not null,
 	last_sal int not null,
 	comm varchar(30),
 	dept_no int not null,
 	job_type varchar (5) not null,
	joining_date date not null,
	leaving_date date not null
);

-- inserting values

--) a)

create or replace procedure salary_hike as
	cursor c is select * from emp;
	record c%rowtype;
	days number;
	num number;
begin
	open c;
	loop
		exit when c%notfound;
		fetch c into record;
		select sysdate - to_date(record.joining_date, 'yyyy/mm/dd') into days 
		from emp;

		if(mod(days, 365) != 0 or days = 0) then 
			continue;
		end if;

		select count(*) into num from dept where dept.dmgrno = record.eno;

		if(num = 0) then
			case
				when record.job_type = 'software engineer' then 
					update emp set sal = sal*1.1 where eno = record.eno;
				when record.job_type = 'human resource' then 
					update emp set sal = sal*1.07 where eno = record.eno;
				when record.job_type = 'production engineer' then 
					update emp set sal = sal*1.15 where eno = record.eno;
				when record.job_type = 'development engineer' then 
					update emp set sal = sal*1.12 where eno = record.eno;
				else 
					update emp set sal = sal*1.15 where eno = record.eno;
			end case;
		else
			case
				when record.job_type = 'software engineer' then 
					update emp set sal = sal*1.15 where eno = record.eno;
				when record.job_type = 'human resource' then 
					update emp set sal = sal*1.1 where eno = record.eno;
				when record.job_type = 'production engineer' then 
					update emp set sal = sal*1.18 where eno = record.eno;
				when record.job_type = 'development engineer' then 
					update emp set sal = sal*1.15 where eno = record.eno;
				else 
					update emp set sal = sal*1.18 where eno = record.eno;
			end case;
		end if;

	end loop;
	close c;
end;
/

create or replace trigger manpower
before update on emp
for each row

declare
	tot_sal number;
	cost_dept manpower_budget.cost%type;
begin
	select sum(sal) into tot_sal 
	from emp
	where dept_no = :new.dept_no;

	tot_sal := tot_sal + :new.sal - :old.sal;

	select cost into cost_dept
	from manpower_budget
	where dno = :new.dept_no;

	if(tot_sal < cost_dept) then
		insert into salary_hike values(:new.eno, :new.ename, sysdate, :new.sal-:old.sal);
	else
		dbms_output.put_line('salary cannot be incremented');
	end if;
end;
/

--) b)

create or replace procedure q2_b as
	cursor c is select dno from dept order by dno;
	temp_dno dept.dno%type;
begin
	open c;
	loop
		exit when c%notfound;
		fetch c into temp_dno;

		declare
			cursor c1 is select e1.ename from emp e1, emp e2 where e1.sal < e2.sal and e1.dept_no = temp_dno group by e1.eno having (1+count(e2.eno)) <= 3;
			temp_name emp.ename%type;
		begin
			open c1;
			loop
				exit when c1%notfound;
				fetch c1 into temp_name;
				dbms_output.put_line(temp_name || '-> ' || temp_dno);
			end loop;
			close c1;
		end;

	end loop;
	close c;
end;
/

--) c)

create view vc as 
select *
from dept;

select * from dept;
select * from vc;

update vc
set location ='bbsr' 
where location = 'bhubaneswar';

select * from vc;

create trigger join_trigger after insert on emp for each row
declare
begin
	insert into employee_history values(:new.eno,:new.ename,:new.sal,:new.comm,:new.dept_number,:new.job_type,:new.joining_date,null);
end;
/

create trigger leave_trigger after delete on emp for each row
declare
begin
	update employee_history set leaving_date=sysdate where eno=:old.eno;
end;
/