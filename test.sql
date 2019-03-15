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