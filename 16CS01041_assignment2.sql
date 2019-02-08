use assignment2;

-- Drop tables
drop table dependent;
drop table works_on;
drop table project;
drop table dept_locations;
drop table employee;
drop table department;

-- Insert tables 
create table department(
	dname varchar(20) not null,
	dnumber int not null,
	mgr_ssn varchar(20),
	mgr_start_date date not null,

	primary key(dnumber)
);

create table employee(
	fname varchar(20) not null,
	minit char not null,
	lname varchar(20) not null,
	ssn varchar(20) not null,
	bdate varchar(20) not null,
	address varchar(30) not null,
	sex char not null,
	salary int not null, 
	super_ssn varchar(20),
	dno int not null,

	primary key(ssn),
	foreign key(dno) references department(dnumber)
);

create table dept_locations(
	dnumber int not null,
	dlocation varchar(20) not null,

	foreign key(dnumber) references department(dnumber)
);

create table project(
	pname varchar(20) not null,
	pnumber int not null,
	plocation varchar(20) not null,
	dnum int not null,

	primary key(pnumber),
	foreign key(dnum) references department(dnumber)
);

create table works_on(
	essn varchar(20) not null,
	pno int not null,
	hours float,

	foreign key(essn) references employee(ssn),
	foreign key(pno) references project(pnumber)
);/* Question-5 */

create table dependent(
	essn varchar(20) not null,
	dependent_name varchar(20) not null,
	sex char not null,
	bdate varchar(20) not null,
	relationship varchar(20) not null,

	foreign key(essn) references employee(ssn)
);

insert into department values('research', '5', '333445555', '1988-05-22');
insert into department values('administration', '4', '987654321', '1995-01-01');
insert into department values('headquarters', '1', '888665555', '1981-06-19');

insert into employee values('john', 'b', 'smith', '123456789', '1965-01-09', '731 fondren, houston, tx', 'm', '30000', '333445555', '5');
insert into employee values('franklin', 't', 'wong', '333445555', '1955-12-08', '638 voss, houston, tx', 'm', '40000', '888665555', '5');
insert into employee values('alicia', 'j', 'zelaya', '999887777', '1968-01-19', '3321 castle, spring, tx', 'f', '25000', '987654321', '4');
insert into employee values('jennifer', 's', 'wallace', '987654321', '1941-06-20', '291 berry, bellaire, tx', 'f', '43000', '888665555', '4');
insert into employee values('ramesh', 'k', 'narayan', '666884444', '1962-09-15', '975 fire oak, humble, tx', 'm', '38000', '333445555', '5');
insert into employee values('joyce', 'a', 'english', '453453453', '1972-07-31', '5631 rice, houston, tx', 'f', '25000', '333445555', '5');
insert into employee values('ahmad', 'v', 'jabbar', '987987987', '1969-03-29', '980 dallas, houston, tx', 'm', '25000', '987654321', '4');
insert into employee values('james', 'e', 'borg', '888665555', '1937-11-10', '450 stone, houston, tx', 'm', '55000', null, '1');

insert into dept_locations values('1', 'housten');
insert into dept_locations values('4', 'stafford');
insert into dept_locations values('5', 'bellaire');
insert into dept_locations values('5', 'sugarland');
insert into dept_locations values('5', 'housten');

insert into project values('productx', '1', 'bellaire', '5');
insert into project values('producty', '2', 'sugarland', '5');
insert into project values('productz', '3', 'houston', '5');
insert into project values('computerization', '10', 'stafford', '4');
insert into project values('reorganization', '20', 'houston', '1');
insert into project values('newbenefits', '30', 'stafford', '4');

insert into works_on values('123456789', '1', '32.5');
insert into works_on values('123456789', '2', '7.5');
insert into works_on values('666884444', '3', '40.0');
insert into works_on values('453453453', '1', '20.0');
insert into works_on values('453453453', '2', '20.0');
insert into works_on values('333445555', '2', '10.0');
insert into works_on values('333445555', '3', '10.0');
insert into works_on values('333445555', '10', '10.0');
insert into works_on values('333445555', '20', '10.0');
insert into works_on values('999887777', '30', '30.0');
insert into works_on values('999887777', '10', '10.0');
insert into works_on values('987987987', '10', '35.0');
insert into works_on values('987987987', '30', '5.0');
insert into works_on values('987654321', '30', '20.0');
insert into works_on values('987654321', '20', '15.0');
insert into works_on values('888665555', '20', null);

insert into dependent values('333445555', 'alice', 'f', '1986-04-05', 'daughter');
insert into dependent values('333445555', 'theodore', 'm', '1983-10-25', 'son');
insert into dependent values('333445555', 'joy', 'f', '1958-05-03', 'spouse');
insert into dependent values('987654321', 'abner', 'm', '1942-02-28', 'spouse');
insert into dependent values('123456789', 'michael', 'm', '1988-01-04', 'son');
insert into dependent values('123456789', 'alice', 'f', '1988-12-30', 'daughter');
insert into dependent values('123456789', 'elizabeth', 'f', '1967-05-05', 'spouse');

-- set environment
set session sql_mode='strict_trans_tables,no_zero_in_date,no_zero_date,error_for_division_by_zero,no_engine_substitution';


-- Question a
select p.pname,d.dname,concat(e.fname,' ',e.lname) as name,e.address,e.bdate 
from project as p 
inner join department as d on d.dnumber=p.dnum 
inner join employee as e on e.ssn=d.mgr_ssn 
where p.plocation="stafford";

-- +-----------------+----------------+------------------+-------------------------+------------+
-- | pname           | dname          | name             | address                 | bdate      |
-- +-----------------+----------------+------------------+-------------------------+------------+
-- | computerization | administration | jennifer wallace | 291 berry, bellaire, tx | 1941-06-20 |
-- | newbenefits     | administration | jennifer wallace | 291 berry, bellaire, tx | 1941-06-20 |
-- +-----------------+----------------+------------------+-------------------------+------------+
-- 2 rows in set (0.00 sec)

-- Question b
select concat(e.fname,' ',e.lname) as name,e.salary*1.1 as new_sal 
from project as p 
inner join works_on as w on w.pno=p.pnumber 
inner join employee as e on e.ssn=w.essn 
where p.pname="productx";

-- +---------------+---------+
-- | name          | new_sal |
-- +---------------+---------+
-- | john smith    | 33000.0 |
-- | joyce english | 27500.0 |
-- +---------------+---------+
-- 2 rows in set (0.00 sec)

-- Question c
select concat(e.fname,' ',e.lname) as name,p.pname 
from employee as e 
inner join works_on as w on w.essn=e.ssn 
inner join project as p on p.pnumber=w.pno 
order by e.dno,e.lname,e.fname;

-- +------------------+-----------------+
-- | name             | pname           |
-- +------------------+-----------------+
-- | james borg       | reorganization  |
-- | ahmad jabbar     | newbenefits     |
-- | ahmad jabbar     | computerization |
-- | jennifer wallace | newbenefits     |
-- | jennifer wallace | reorganization  |
-- | alicia zelaya    | newbenefits     |
-- | alicia zelaya    | computerization |
-- | joyce english    | productx        |
-- | joyce english    | producty        |
-- | ramesh narayan   | productz        |
-- | john smith       | productx        |
-- | john smith       | producty        |
-- | franklin wong    | producty        |
-- | franklin wong    | productz        |
-- | franklin wong    | computerization |
-- | franklin wong    | reorganization  |
-- +------------------+-----------------+
-- 16 rows in set (0.00 sec)

-- Question d
select concat(e.fname,' ',e.lname) as employee_name,concat(m.fname,' ',m.lname) as manager_name 
from project as p inner join works_on as w on w.pno=p.pnumber and w.hours>10 
inner join employee as e on e.ssn=w.essn 
inner join employee as m on m.ssn=e.super_ssn 
where p.pname="productx";

-- +---------------+---------------+
-- | employee_name | manager_name  |
-- +---------------+---------------+
-- | john smith    | franklin wong |
-- | joyce english | franklin wong |
-- +---------------+---------------+
-- 2 rows in set (0.00 sec)

-- Question e
select distinct w.essn 
from works_on w 
where w.essn!="123456789" and (w.pno,w.hours) in 
(select w1.pno,w1.hours from works_on w1 where w1.essn="123456789");

-- Empty set (0.00 sec)

-- Question f
select concat(e.fname,' ',e.lname) as name 
from employee e 
inner join dependent d on e.ssn=d.essn and e.fname=d.dependent_name and e.sex=d.sex;

-- Empty set (0.00 sec)

-- Question g
select sum(salary),max(salary),min(salary),avg(salary) 
from employee e 
inner join department d on d.dnumber=e.dno 
where d.dname="research";

-- +-------------+-------------+-------------+-------------+
-- | sum(salary) | max(salary) | min(salary) | avg(salary) |
-- +-------------+-------------+-------------+-------------+
-- |      133000 |       40000 |       25000 |  33250.0000 |
-- +-------------+-------------+-------------+-------------+
-- 1 row in set (0.00 sec)

-- Question h
select e.dno,count(e.dno) as no 
from employee e 
where e.salary>30000 
group by e.dno;

-- +-----+----+
-- | dno | no |
-- +-----+----+
-- |   1 |  1 |
-- |   4 |  1 |
-- |   5 |  2 |
-- +-----+----+
-- 3 rows in set (0.00 sec)

-- Question i
update employee 
set salary=salary*1.1 
where ssn in 
(select essn from dependent where relationship="daughter");

select * from employee;

-- +----------+-------+---------+-----------+------------+--------------------------+-----+--------+-----------+-----+
-- | fname    | minit | lname   | ssn       | bdate      | address                  | sex | salary | super_ssn | dno |
-- +----------+-------+---------+-----------+------------+--------------------------+-----+--------+-----------+-----+
-- | john     | b     | smith   | 123456789 | 1965-01-09 | 731 fondren, houston, tx | m   |  33000 | 333445555 |   5 |
-- | franklin | t     | wong    | 333445555 | 1955-12-08 | 638 voss, houston, tx    | m   |  44000 | 888665555 |   5 |
-- | joyce    | a     | english | 453453453 | 1972-07-31 | 5631 rice, houston, tx   | f   |  25000 | 333445555 |   5 |
-- | ramesh   | k     | narayan | 666884444 | 1962-09-15 | 975 fire oak, humble, tx | m   |  38000 | 333445555 |   5 |
-- | james    | e     | borg    | 888665555 | 1937-11-10 | 450 stone, houston, tx   | m   |  55000 | NULL      |   1 |
-- | jennifer | s     | wallace | 987654321 | 1941-06-20 | 291 berry, bellaire, tx  | f   |  43000 | 888665555 |   4 |
-- | ahmad    | v     | jabbar  | 987987987 | 1969-03-29 | 980 dallas, houston, tx  | m   |  25000 | 987654321 |   4 |
-- | alicia   | j     | zelaya  | 999887777 | 1968-01-19 | 3321 castle, spring, tx  | f   |  25000 | 987654321 |   4 |
-- +----------+-------+---------+-----------+------------+--------------------------+-----+--------+-----------+-----+
-- 8 rows in set (0.01 sec)

-- Question j
update employee 
set dno = 
(select dno from dept_locations where dlocation="stafford") 
where bdate like '1965-%';

select * from employee;

-- +----------+-------+---------+-----------+------------+--------------------------+-----+--------+-----------+-----+
-- | fname    | minit | lname   | ssn       | bdate      | address                  | sex | salary | super_ssn | dno |
-- +----------+-------+---------+-----------+------------+--------------------------+-----+--------+-----------+-----+
-- | john     | b     | smith   | 123456789 | 1965-01-09 | 731 fondren, houston, tx | m   |  33000 | 333445555 |   5 |
-- | franklin | t     | wong    | 333445555 | 1955-12-08 | 638 voss, houston, tx    | m   |  44000 | 888665555 |   5 |
-- | joyce    | a     | english | 453453453 | 1972-07-31 | 5631 rice, houston, tx   | f   |  25000 | 333445555 |   5 |
-- | ramesh   | k     | narayan | 666884444 | 1962-09-15 | 975 fire oak, humble, tx | m   |  38000 | 333445555 |   5 |
-- | james    | e     | borg    | 888665555 | 1937-11-10 | 450 stone, houston, tx   | m   |  55000 | NULL      |   1 |
-- | jennifer | s     | wallace | 987654321 | 1941-06-20 | 291 berry, bellaire, tx  | f   |  43000 | 888665555 |   4 |
-- | ahmad    | v     | jabbar  | 987987987 | 1969-03-29 | 980 dallas, houston, tx  | m   |  25000 | 987654321 |   4 |
-- | alicia   | j     | zelaya  | 999887777 | 1968-01-19 | 3321 castle, spring, tx  | f   |  25000 | 987654321 |   4 |
-- +----------+-------+---------+-----------+------------+--------------------------+-----+--------+-----------+-----+
-- 8 rows in set (0.00 sec)