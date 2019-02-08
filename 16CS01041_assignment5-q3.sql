-- Drop tables
drop table patient;
drop table doctor;
drop table opd_schedule;
drop table appointment;
drop table opd_payments;

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
create table patient(
	patient_id int not null,
	patient_name varchar(30) not null,
	dob date not null,
	sex varchar(5) not null
);

create table doctor(
	doctor_id int not null,
	name varchar(30) not null,
	specialisation varchar(30) not null,
	unit varchar(20)
);

create table opd_schedule(
	doctor_id int not null,
	opd_date timestamp not null,
	fees int not null
);

create table appointment(
	appointment_no int not null,
	patient_id int not null,
	doctor_id int not null,
	appt_date timestamp not null
);

create table opd_payments(
	appointment_no int not null,
	patient_id int not null,
	amt int not null,
	date_payment timestamp not null
);

-- insert tables
insert into doctor values('1', 'Black', 'Intestine', 'SURGEON');
insert into doctor values('2', 'White', 'Skin', 'CONSULTANT');

insert into patient values('1', 'Patient A', '12-feb-1999', 'M');
insert into patient values('2', 'Patient B', '20-mar-1978', 'F');	
insert into patient values('3', 'Patient C', '09-jun-2011', 'M');

insert into opd_schedule values('2', to_timestamp('04-feb-2019 21:00:00', 'DD-MM-YYYY HH24:MI:SS'), '4000');
insert into opd_schedule values('2', to_timestamp('05-feb-2019 09:00:00', 'DD-MM-YYYY HH24:MI:SS'), '4000');
insert into opd_schedule values('2', to_timestamp('05-feb-2019 10:00:00', 'DD-MM-YYYY HH24:MI:SS'), '4000');

insert into appointment values('1', '1', '2', to_timestamp('04-feb-2019 21:00:00', 'DD-MM-YYYY HH24:MI:SS'));
insert into appointment values('2', '3', '2', to_timestamp('05-feb-2019 09:00:00', 'DD-MM-YYYY HH24:MI:SS'));
insert into appointment values('3', '1', '2', to_timestamp('05-feb-2019 10:00:00', 'DD-MM-YYYY HH24:MI:SS'));

-- Quetion 1
select distinct p.patient_id, p.patient_name
from patient p, appointment a1, appointment a2 
where abs(extract(hour from a1.appt_date-a2.appt_date))<&period
		and abs(extract(hour from a1.appt_date-a2.appt_date))!=0
		and a1.patient_id=a2.patient_id
		and a1.doctor_id=a2.doctor_id
		and p.patient_id=a1.patient_id
group by p.patient_id, p.patient_name
having count(*)>2;

-- Quetion 2
create or replace trigger updatePayments after insert on appointment for each row
declare
	fee opd_schedule.fees % type;
	birth patient.dob % type;
	gender patient.sex % type;
	n number;
begin
	select fees into fee from opd_schedule where opd_date=:new.appt_date;
	select dob,sex into birth,gender from patient where patient_id=:new.patient_id;
	
	if (extract(year from sysdate)-extract(year from birth))>50 and gender='F' then
		fee := fee/2;
	end if;

	select count(*) into n from appointment where patient_id=:new.patient_id 
										and (extract(day from appt_date)-extract(day from :new.appt_date))<=7
										and appointment_no!=:new.appointment_no;
	if n>0 then
		fee := 0;
	end if;

	insert into opd_payments values(:new.appointment_no, :new.patient_id, fee, :new.appt_date);

end;

-- Quetion 3
select
	count(*) as num_p, unit
from
	doctor, appointment
where
	appointment.doctor_id = doctor.doctor_id
group by
	doctor.unit;

select
	count(*) as num_p, appt_date
from
	doctor, appointment
where
	appointment.doctor_id = doctor.doctor_id
group by
	appointment.appt_date;


-- Quetion 4
create view v4 as 
select * from opd_schedule;

update 
	v4
set 
	v4.opd_date = &some_date
where
	v4.doctor_id = &some_doctor;

-- Quetion 5
create view v5 as
select 
	p.patient_name, extract(year from current_date)-extract(year from p.dob) age, opd.date_payment, d.name
from 
	patient p, opd_payments opd, appointment a, doctor d
where 
	a.appt_date >= &start_period and a.appt_date <= &end_period and opd.patient_id = p.patient_id and opd.appointment_no = a.appointment_no and a.doctor_id = d.doctor_id and opd.patient_id = a.patient_id;

-- Quetion 6
create view v6 as 
select * from opd_schedule;
update 
	v6
set 
	fees = fees + &val;
where
	doctor_id = &doctor;