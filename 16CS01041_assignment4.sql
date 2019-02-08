-- Drop tables
drop table regions;
drop table countries;
drop table locations;
drop table jobs;
drop table employees;
drop table departments;
drop table job_history;
drop view test

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
create table regions(
	region_id int not null,
	region_name varchar(30) not null
);

create table countries(
  	country_id varchar(2) not null,
  	country_name varchar(30) default null,
  	region_id int default null 
);

create table locations(
	location_id int not null,
	street_address varchar(30) not null,
	postal_code varchar(20) default null,
	city varchar(20) not null,
	state_province varchar(20) default null,
	country_id varchar(2) not null
);

create table jobs(
	job_id varchar(10) not null,
	job_title varchar(40) not null,
	min_salary int not null,
	max_salary int not null
);

create table employees(
	employee_id int not null,
	first_name varchar(15) not null,
	last_name varchar(15) not null,
	email varchar(15) not null,
	phone_number varchar(20) not null,
	hire_date varchar(15) not null,
	job_id varchar(10) not null,
	salary int not null,
	commission_pct float not null,
	manager_id int default null,
	department_id int default null
);

create table departments(
	department_id int not null,
	department_name varchar(30) not null,
	manager_id int default null,
	location_id int not null
);

create table job_history(
	employee_id int not null,
	start_date varchar(15) not null,
	end_date varchar(15) not null,
	job_id varchar(10) not null,
	department_id int not null
);


-- insert tables
insert into regions(region_id, region_name) values ('1', 'europe');
insert into regions(region_id, region_name) values ('2', 'america');
insert into regions(region_id, region_name) values ('3', 'asia');
insert into regions(region_id, region_name) values ('4', 'middle east and africa');


insert into countries(country_id, country_name, region_id) values ('ar', 'argentina', '2');
insert into countries(country_id, country_name, region_id) values ('au', 'australia', '3');
insert into countries(country_id, country_name, region_id) values ('be', 'belgium', '1');
insert into countries(country_id, country_name, region_id) values ('br', 'brazil', '2');
insert into countries(country_id, country_name, region_id) values ('ca', 'canada', '2');
insert into countries(country_id, country_name, region_id) values ('ch', 'switzerland', '1');
insert into countries(country_id, country_name, region_id) values ('cn', 'china', '3');
insert into countries(country_id, country_name, region_id) values ('de', 'germany', '1');
insert into countries(country_id, country_name, region_id) values ('dk', 'denmark', '1');
insert into countries(country_id, country_name, region_id) values ('eg', 'egypt', '4');
insert into countries(country_id, country_name, region_id) values ('fr', 'france', '1');
insert into countries(country_id, country_name, region_id) values ('il', 'israel', '4');
insert into countries(country_id, country_name, region_id) values ('in', 'india', '3');
insert into countries(country_id, country_name, region_id) values ('it', 'italy', '1');
insert into countries(country_id, country_name, region_id) values ('jp', 'japan', '3');
insert into countries(country_id, country_name, region_id) values ('kw', 'kuwait', '4');
insert into countries(country_id, country_name, region_id) values ('ml', 'malaysia', '3');
insert into countries(country_id, country_name, region_id) values ('mx', 'mexico', '2');
insert into countries(country_id, country_name, region_id) values ('ng', 'nigeria', '4');
insert into countries(country_id, country_name, region_id) values ('nl', 'netherlands', '1');
insert into countries(country_id, country_name, region_id) values ('sg', 'singapore', '3');
insert into countries(country_id, country_name, region_id) values ('uk', 'united kingdom', '1');
insert into countries(country_id, country_name, region_id) values ('us', 'united states of america', '2');
insert into countries(country_id, country_name, region_id) values ('zm', 'zambia', '4');
insert into countries(country_id, country_name, region_id) values ('zw', 'zimbabwe', '4');


insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('1000', '1297 via cola di rie', '989', 'roma', null, 'it');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('1100', '93091 calle della testa', '10934', 'venice', null, 'it');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('1200', '2017 shinjuku-ku', '1689', 'tokyo', 'tokyo prefectur', 'jp');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('1300', '9450 kamiya-cho', '6823', 'hiroshima', null, 'jp');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('1400', '2014 jabberwocky rd', '26192', 'southlake', 'texas', 'us');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('1500', '2011 interiors blvd', '99236', 'south san franc', 'california', 'us');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('1600', '2007 zagora st', '50090', 'south brunswick', 'new jersey', 'us');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('1700', '2004 charade rd', '98199', 'seattle', 'washington', 'us');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('1800', '147 spadina ave', 'm5v 2l7', 'toronto', 'ontario', 'ca');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('1900', '6092 boxwood st', 'ysw 9t2', 'whitehorse', 'yukon', 'ca');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('2000', '40-5-12 laogianggen', '190518', 'beijing', null, 'cn');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('2100', '1298 vileparle (e)', '490231', 'bombay', 'maharashtra', 'in');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('2200', '12-98 victoria street', '2901', 'sydney', 'new south wales', 'au');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('2300', '198 clementi north', '540198', 'singapore', null, 'sg');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('2400', '8204 arthur st', null, 'london', null, 'uk');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('2500', 'magdalen centre, the oxford sc', 'ox9 9zb', 'oxford', 'oxford', 'uk');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('2600', '9702 chester road', '9629850293', 'stretford', 'manchester', 'uk');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('2700', 'schwanthalerstr. 7031', '80925', 'munich', 'bavaria', 'de');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('2800', 'rua frei caneca 1360', '01307-002', 'sao paulo', 'sao paulo', 'br');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('2900', '20 rue des corps-saints', '1730', 'geneva', 'geneve', 'ch');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('3000', 'murtenstrasse 921', '3095', 'bern', 'be', 'ch');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('3100', 'pieter breughelstraat 837', '3029sk', 'utrecht', 'utrecht', 'nl');
insert into locations(location_id, street_address, postal_code, city, state_province, country_id) values ('3200', 'mariano escobedo 9991', '11932', 'mexico city', 'distrito federa', 'mx');


insert into jobs(job_id, job_title, min_salary, max_salary) values ('ac_account', 'public accountant', '4200', '9000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('ac_mgr', 'accounting manager', '8200', '16000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('ad_asst', 'administration assistant', '3000', '6000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('ad_pres', 'president', '20080', '40000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('ad_vp', 'administration vice president', '15000', '30000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('fi_account', 'accountant', '4200', '9000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('fi_mgr', 'finance manager', '8200', '16000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('hr_rep', 'human resources representative', '4000', '9000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('it_prog', 'programmer', '4000', '10000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('mk_man', 'marketing manager', '9000', '15000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('mk_rep', 'marketing representative', '4000', '9000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('pr_rep', 'public relations representative', '4500', '10500');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('pu_clerk', 'purchasing clerk', '2500', '5500');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('pu_man', 'purchasing manager', '8000', '15000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('sa_man', 'sales manager', '10000', '20080');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('sa_rep', 'sales representative', '6000', '12008');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('sh_clerk', 'shipping clerk', '2500', '5500');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('st_clerk', 'stock clerk', '2008', '5000');
insert into jobs(job_id, job_title, min_salary, max_salary) values ('st_man', 'stock manager', '5500', '8500');


insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('100', 'steven', 'king', 'sking', '515.123.4567', '17-jun-03', 'ad_pres', '24000', '0.000', null, '90');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('101', 'neena', 'kochhar', 'nkochhar', '515.123.4568', '21-sep-05', 'ad_vp', '17000', '0.000', '100', '90');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('102', 'lex', 'de haan', 'ldehaan', '515.123.4569', '13-jan-01', 'ad_vp', '17000', '0.000', '100', '90');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('103', 'alexander', 'hunold', 'ahunold', '590.423.4567', '3-jan-06', 'it_prog', '9000', '0.000', '102', '60');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('104', 'bruce', 'ernst', 'bernst', '590.423.4568', '21-may-07', 'it_prog', '6000', '0.000', '103', '60');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('105', 'david', 'austin', 'daustin', '590.423.4569', '25-jun-05', 'it_prog', '4800', '0.000', '103', '60');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('106', 'valli', 'pataballa', 'vpatabal', '590.423.4560', '5-feb-06', 'it_prog', '4800', '0.000', '103', '60');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('107', 'diana', 'lorentz', 'dlorentz', '590.423.5567', '7-feb-07', 'it_prog', '4200', '0.000', '103', '60');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('108', 'nancy', 'greenberg', 'ngreenbe', '515.124.4569', '17-aug-02', 'fi_mgr', '12008', '0.000', '101', '100');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('109', 'daniel', 'faviet', 'dfaviet', '515.124.4169', '16-aug-02', 'fi_account', '9000', '0.000', '108', '100');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('110', 'john', 'chen', 'jchen', '515.124.4269', '28-sep-05', 'fi_account', '8200', '0.000', '108', '100');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('111', 'ismael', 'sciarra', 'isciarra', '515.124.4369', '30-sep-05', 'fi_account', '7700', '0.000', '108', '100');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('112', 'jose manue', 'urman', 'jmurman', '515.124.4469', '7-mar-06', 'fi_account', '7800', '0.000', '108', '100');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('113', 'luis', 'popp', 'lpopp', '515.124.4567', '7-dec-07', 'fi_account', '6900', '0.000', '108', '100');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('114', 'den', 'raphaely', 'drapheal', '515.127.4561', '7-dec-02', 'pu_man', '11000', '0.000', '100', '30');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('115', 'alexander', 'khoo', 'akhoo', '515.127.4562', '18-may-03', 'pu_clerk', '3100', '0.000', '114', '30');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('116', 'shelli', 'baida', 'sbaida', '515.127.4563', '24-dec-05', 'pu_clerk', '2900', '0.000', '114', '30');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('117', 'sigal', 'tobias', 'stobias', '515.127.4564', '24-jul-05', 'pu_clerk', '2800', '0.000', '114', '30');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('118', 'guy', 'himuro', 'ghimuro', '515.127.4565', '15-nov-06', 'pu_clerk', '2600', '0.000', '114', '30');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('119', 'karen', 'colmenares', 'kcolmena', '515.127.4566', '10-aug-07', 'pu_clerk', '2500', '0.000', '114', '30');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('120', 'matthew', 'weiss', 'mweiss', '650.123.1234', '18-jul-04', 'st_man', '8000', '0.000', '100', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('121', 'adam', 'fripp', 'afripp', '650.123.2234', '10-apr-05', 'st_man', '8200', '0.000', '100', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('122', 'payam', 'kaufling', 'pkauflin', '650.123.3234', '1-may-03', 'st_man', '7900', '0.000', '100', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('123', 'shanta', 'vollman', 'svollman', '650.123.4234', '10-oct-05', 'st_man', '6500', '0.000', '100', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('124', 'kevin', 'mourgos', 'kmourgos', '650.123.5234', '16-nov-07', 'st_man', '5800', '0.000', '100', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('125', 'julia', 'nayer', 'jnayer', '650.124.1214', '16-jul-05', 'st_clerk', '3200', '0.000', '120', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('126', 'irene', 'mikkilinen', 'imikkili', '650.124.1224', '28-sep-06', 'st_clerk', '2700', '0.000', '120', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('127', 'james', 'landry', 'jlandry', '650.124.1334', '14-jan-07', 'st_clerk', '2400', '0.000', '120', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('128', 'steven', 'markle', 'smarkle', '650.124.1434', '8-mar-08', 'st_clerk', '2200', '0.000', '120', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('129', 'laura', 'bissot', 'lbissot', '650.124.5234', '20-aug-05', 'st_clerk', '3300', '0.000', '121', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('130', 'mozhe', 'atkinson', 'matkinso', '650.124.6234', '30-oct-05', 'st_clerk', '2800', '0.000', '121', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('131', 'james', 'marlow', 'jamrlow', '650.124.7234', '16-feb-05', 'st_clerk', '2500', '0.000', '121', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('132', 'tj', 'olson', 'tjolson', '650.124.8234', '10-apr-07', 'st_clerk', '2100', '0.000', '121', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('133', 'jason', 'mallin', 'jmallin', '650.127.1934', '14-jun-04', 'st_clerk', '3300', '0.000', '122', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('134', 'michael', 'rogers', 'mrogers', '650.127.1834', '26-aug-06', 'st_clerk', '2900', '0.000', '122', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('135', 'ki', 'gee', 'kgee', '650.127.1734', '12-dec-07', 'st_clerk', '2400', '0.000', '122', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('136', 'hazel', 'philtanker', 'hphiltan', '650.127.1634', '6-feb-08', 'st_clerk', '2200', '0.000', '122', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('137', 'renske', 'ladwig', 'rladwig', '650.121.1234', '14-jul-03', 'st_clerk', '3600', '0.000', '123', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('138', 'stephen', 'stiles', 'sstiles', '650.121.2034', '26-oct-05', 'st_clerk', '3200', '0.000', '123', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('139', 'john', 'seo', 'jseo', '650.121.2019', '12-feb-06', 'st_clerk', '2700', '0.000', '123', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('140', 'joshua', 'patel', 'jpatel', '650.121.1834', '6-apr-06', 'st_clerk', '2500', '0.000', '123', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('141', 'trenna', 'rajs', 'trajs', '650.121.8009', '17-oct-03', 'st_clerk', '3500', '0.000', '124', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('142', 'curtis', 'davies', 'cdavies', '650.121.2994', '29-jan-05', 'st_clerk', '3100', '0.000', '124', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('143', 'randall', 'matos', 'rmatos', '650.121.2874', '15-mar-06', 'st_clerk', '2600', '0.000', '124', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('144', 'peter', 'vargas', 'pvargas', '650.121.2004', '9-jul-06', 'st_clerk', '2500', '0.000', '124', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('145', 'john', 'russell', 'jrussel', '011.44.1344.429268', '1-oct-04', 'sa_man', '14000', '0.400', '100', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('146', 'karen', 'partners', 'kpartner', '011.44.1344.467268', '5-jan-05', 'sa_man', '13500', '0.300', '100', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('147', 'alberto', 'errazuriz', 'aerrazur', '011.44.1344.429278', '10-mar-05', 'sa_man', '12000', '0.300', '100', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('148', 'gerald', 'cambrault', 'gcambrau', '011.44.1344.619268', '15-oct-07', 'sa_man', '11000', '0.300', '100', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('149', 'eleni', 'zlotkey', 'ezlotkey', '011.44.1344.429018', '29-jan-08', 'sa_man', '10500', '0.200', '100', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('150', 'peter', 'tucker', 'ptucker', '011.44.1344.129268', '30-jan-05', 'sa_rep', '10000', '0.300', '145', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('151', 'david', 'bernstein', 'dbernste', '011.44.1344.345268', '24-mar-05', 'sa_rep', '9500', '0.250', '145', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('152', 'peter', 'hall', 'phall', '011.44.1344.478968', '20-aug-05', 'sa_rep', '9000', '0.250', '145', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('153', 'christophe', 'olsen', 'colsen', '011.44.1344.498718', '30-mar-06', 'sa_rep', '8000', '0.200', '145', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('154', 'nanette', 'cambrault', 'ncambrau', '011.44.1344.987668', '9-dec-06', 'sa_rep', '7500', '0.200', '145', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('155', 'oliver', 'tuvault', 'otuvault', '011.44.1344.486508', '23-nov-07', 'sa_rep', '7000', '0.150', '145', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('156', 'janette', 'king', 'jking', '011.44.1345.429268', '30-jan-04', 'sa_rep', '10000', '0.350', '146', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('157', 'patrick', 'sully', 'psully', '011.44.1345.929268', '4-mar-04', 'sa_rep', '9500', '0.350', '146', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('158', 'allan', 'mcewen', 'amcewen', '011.44.1345.829268', '1-aug-04', 'sa_rep', '9000', '0.350', '146', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('159', 'lindsey', 'smith', 'lsmith', '011.44.1345.729268', '10-mar-05', 'sa_rep', '8000', '0.300', '146', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('160', 'louise', 'doran', 'ldoran', '011.44.1345.629268', '15-dec-05', 'sa_rep', '7500', '0.300', '146', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('161', 'sarath', 'sewall', 'ssewall', '011.44.1345.529268', '3-nov-06', 'sa_rep', '7000', '0.250', '146', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('162', 'clara', 'vishney', 'cvishney', '011.44.1346.129268', '11-nov-05', 'sa_rep', '10500', '0.250', '147', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('163', 'danielle', 'greene', 'dgreene', '011.44.1346.229268', '19-mar-07', 'sa_rep', '9500', '0.150', '147', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('164', 'mattea', 'marvins', 'mmarvins', '011.44.1346.329268', '24-jan-08', 'sa_rep', '7200', '0.100', '147', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('165', 'david', 'lee', 'dlee', '011.44.1346.529268', '23-feb-08', 'sa_rep', '6800', '0.100', '147', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('166', 'sundar', 'ande', 'sande', '011.44.1346.629268', '24-mar-08', 'sa_rep', '6400', '0.100', '147', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('167', 'amit', 'banda', 'abanda', '011.44.1346.729268', '21-apr-08', 'sa_rep', '6200', '0.100', '147', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('168', 'lisa', 'ozer', 'lozer', '011.44.1343.929268', '11-mar-05', 'sa_rep', '11500', '0.250', '148', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('169', 'harrison', 'bloom', 'hbloom', '011.44.1343.829268', '23-mar-06', 'sa_rep', '10000', '0.200', '148', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('170', 'tayler', 'fox', 'tfox', '011.44.1343.729268', '24-jan-06', 'sa_rep', '9600', '0.200', '148', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('171', 'william', 'smith', 'wsmith', '011.44.1343.629268', '23-feb-07', 'sa_rep', '7400', '0.150', '148', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('172', 'elizabeth', 'bates', 'ebates', '011.44.1343.529268', '24-mar-07', 'sa_rep', '7300', '0.150', '148', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('173', 'sundita', 'kumar', 'skumar', '011.44.1343.329268', '21-apr-08', 'sa_rep', '6100', '0.100', '148', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('174', 'ellen', 'abel', 'eabel', '011.44.1644.429267', '11-may-04', 'sa_rep', '11000', '0.300', '149', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('175', 'alyssa', 'hutton', 'ahutton', '011.44.1644.429266', '19-mar-05', 'sa_rep', '8800', '0.250', '149', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('176', 'jonathon', 'taylor', 'jtaylor', '011.44.1644.429265', '24-mar-06', 'sa_rep', '8600', '0.200', '149', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('177', 'jack', 'livingston', 'jlivings', '011.44.1644.429264', '23-apr-06', 'sa_rep', '8400', '0.200', '149', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('178', 'kimberely', 'grant', 'kgrant', '011.44.1644.429263', '24-may-07', 'sa_rep', '7000', '0.150', '149', null);
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('179', 'charles', 'johnson', 'cjohnson', '011.44.1644.429262', '4-jan-08', 'sa_rep', '6200', '0.100', '149', '80');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('180', 'winston', 'taylor', 'wtaylor', '650.507.9876', '24-jan-06', 'sh_clerk', '3200', '0.000', '120', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('181', 'jean', 'fleaur', 'jfleaur', '650.507.9877', '23-feb-06', 'sh_clerk', '3100', '0.000', '120', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('182', 'martha', 'sullivan', 'msulliva', '650.507.9878', '21-jun-07', 'sh_clerk', '2500', '0.000', '120', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('183', 'girard', 'geoni', 'ggeoni', '650.507.9879', '3-feb-08', 'sh_clerk', '2800', '0.000', '120', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('184', 'nandita', 'sarchand', 'nsarchan', '650.509.1876', '27-jan-04', 'sh_clerk', '4200', '0.000', '121', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('185', 'alexis', 'bull', 'abull', '650.509.2876', '20-feb-05', 'sh_clerk', '4100', '0.000', '121', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('186', 'julia', 'dellinger', 'jdelling', '650.509.3876', '24-jun-06', 'sh_clerk', '3400', '0.000', '121', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('187', 'anthony', 'cabrio', 'acabrio', '650.509.4876', '7-feb-07', 'sh_clerk', '3000', '0.000', '121', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('188', 'kelly', 'chung', 'kchung', '650.505.1876', '14-jun-05', 'sh_clerk', '3800', '0.000', '122', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('189', 'jennifer', 'dilly', 'jdilly', '650.505.2876', '13-aug-05', 'sh_clerk', '3600', '0.000', '122', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('190', 'timothy', 'gates', 'tgates', '650.505.3876', '11-jul-06', 'sh_clerk', '2900', '0.000', '122', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('191', 'randall', 'perkins', 'rperkins', '650.505.4876', '19-dec-07', 'sh_clerk', '2500', '0.000', '122', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('192', 'sarah', 'bell', 'sbell', '650.501.1876', '4-feb-04', 'sh_clerk', '4000', '0.000', '123', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('193', 'britney', 'everett', 'beverett', '650.501.2876', '3-mar-05', 'sh_clerk', '3900', '0.000', '123', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('194', 'samuel', 'mccain', 'smccain', '650.501.3876', '1-jul-06', 'sh_clerk', '3200', '0.000', '123', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('195', 'vance', 'jones', 'vjones', '650.501.4876', '17-mar-07', 'sh_clerk', '2800', '0.000', '123', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('196', 'alana', 'walsh', 'awalsh', '650.507.9811', '24-apr-06', 'sh_clerk', '3100', '0.000', '124', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('197', 'kevin', 'feeney', 'kfeeney', '650.507.9822', '23-may-06', 'sh_clerk', '3000', '0.000', '124', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('198', 'donald', 'oconnell', 'doconnel', '650.507.9833', '21-jun-07', 'sh_clerk', '2600', '0.000', '124', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('199', 'douglas', 'grant', 'dgrant', '650.507.9844', '13-jan-08', 'sh_clerk', '2600', '0.000', '124', '50');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('200', 'jennifer', 'whalen', 'jwhalen', '515.123.4444', '17-sep-03', 'ad_asst', '4400', '0.000', '101', '10');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('201', 'michael', 'hartstein', 'mhartste', '515.123.5555', '17-feb-04', 'mk_man', '13000', '0.000', '100', '20');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('202', 'pat', 'fay', 'pfay', '603.123.6666', '17-aug-05', 'mk_rep', '6000', '0.000', '201', '20');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('203', 'susan', 'mavris', 'smavris', '515.123.7777', '7-jun-02', 'hr_rep', '6500', '0.000', '101', '40');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('204', 'hermann', 'baer', 'hbaer', '515.123.8888', '7-jun-02', 'pr_rep', '10000', '0.000', '101', '70');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('205', 'shelley', 'higgins', 'shiggins', '515.123.8080', '7-jun-02', 'ac_mgr', '12008', '0.000', '101', '110');
insert into employees(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) values ('206', 'william', 'gietz', 'wgietz', '515.123.8181', '7-jun-02', 'ac_account', '8300', '0.000', '205', '110');


insert into departments(department_id, department_name, manager_id, location_id) values ('10', 'administration', '200', '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('20', 'marketing', '201', '1800');
insert into departments(department_id, department_name, manager_id, location_id) values ('30', 'purchasing', '114', '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('40', 'human resources', '203', '2400');
insert into departments(department_id, department_name, manager_id, location_id) values ('50', 'shipping', '121', '1500');
insert into departments(department_id, department_name, manager_id, location_id) values ('60', 'it', '103', '1400');
insert into departments(department_id, department_name, manager_id, location_id) values ('70', 'public relations', '204', '2700');
insert into departments(department_id, department_name, manager_id, location_id) values ('80', 'sales', '145', '2500');
insert into departments(department_id, department_name, manager_id, location_id) values ('90', 'executive', '100', '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('100', 'finance', '108', '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('110', 'accounting', '205', '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('120', 'treasury', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('130', 'corporate tax', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('140', 'control and credit', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('150', 'shareholder services', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('160', 'benefits', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('170', 'manufacturing', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('180', 'construction', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('190', 'contracting', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('200', 'operations', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('210', 'it support', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('220', 'noc', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('230', 'it helpdesk', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('240', 'government sales', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('250', 'retail sales', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('260', 'recruiting', null, '1700');
insert into departments(department_id, department_name, manager_id, location_id) values ('270', 'payroll', null, '1700');	


insert into job_history(employee_id, start_date, end_date, job_id, department_id) values ('101', '21-sep-97', '27-oct-01', 'ac_account', '110');
insert into job_history(employee_id, start_date, end_date, job_id, department_id) values ('101', '28-oct-01', '15-mar-05', 'ac_mgr', '110');
insert into job_history(employee_id, start_date, end_date, job_id, department_id) values ('102', '13-jan-01', '24-jul-06', 'it_prog', '60');
insert into job_history(employee_id, start_date, end_date, job_id, department_id) values ('114', '24-mar-06', '31-dec-07', 'st_clerk', '50');
insert into job_history(employee_id, start_date, end_date, job_id, department_id) values ('122', '1-jan-07', '31-dec-07', 'st_clerk', '50');
insert into job_history(employee_id, start_date, end_date, job_id, department_id) values ('176', '1-jan-07', '31-dec-07', 'sa_man', '80');
insert into job_history(employee_id, start_date, end_date, job_id, department_id) values ('176', '24-mar-06', '31-dec-06', 'sa_rep', '80');
insert into job_history(employee_id, start_date, end_date, job_id, department_id) values ('200', '1-jul-02', '31-dec-06', 'ac_account', '90');
insert into job_history(employee_id, start_date, end_date, job_id, department_id) values ('200', '17-sep-95', '17-jun-01', 'ad_asst', '90');
insert into job_history(employee_id, start_date, end_date, job_id, department_id) values ('201', '17-feb-04', '19-dec-07', 'mk_rep', '20');

-- Question 1
declare
    n number;
begin
    dbms_output.put_line('Question 1');
	select count(*) into n from employees where first_name='joe';
	if(n=0) then
		update employees set salary=(select avg(salary) from employees) where employee_id=130;
	elsif(n=1) then
		update employees set salary=(select salary from employees where first_name='joe') where employee_id=130;
	else
		update employees set salary=(select min(salary) from employees where first_name='joe') where employee_id=130;
	end if;
end;

-- Question 2
declare	
	cursor test is select first_name,last_name from employees;
	fname employees.first_name % type;
	lname employees.last_name % type;
begin
	dbms_output.put_line('Question 2');
	open test;
	loop
		fetch test into fname,lname;
		if test%rowcount = 5 or test%rowcount = 10 then
			dbms_output.put_line(fname || ' ' || lname);
		end if;
		exit when test%notfound;
	end loop;
	close test;
end;
/

-- Question 3
declare
begin
	dbms_output.put_line('Question 3');
	update employees 
	set salary=salary*(case when department_id=40 and nvl(commission_pct,0)<=0.3 then 1.1 
							when department_id=70 and nvl(commission_pct,0)<=0.3 then 1.15 
							when (department_id=40 or department_id=70) and nvl(commission_pct,0)>0.3 then 1.05 
							else 1 
						end);
end;
/

-- Question 4
create or replace function getMgr(depid in departments.department_id%type)
return employees.first_name%type
as ans employees.first_name%type;
begin
	select first_name into ans from employees where employee_id=(select manager_id from departments where department_id=depid);
	return ans;
end getMgr;
/

-- Question 5
create or replace procedure updateMgr(depid in departments.department_id%type) 
as
begin
	update departments set manager_id=
		(select employee_id from employees where salary=
			(select max(salary) from employees where department_id=depid)) 
		where department_id=depid;
end updateMgr;
/

-- Question 6
create or replace trigger noDecrSal 
before update of salary on employees
for each row
when (new.salary < old.salary) 
declare
begin 
   :new.salary := :old.salary;
end;
/ 

-- Question 7
create or replace trigger violateSalary 
before insert on employees
for each row 
declare
	maxsal int(10) default 0;
	minsal int(10) default 0;
begin
	select max_salary into maxsal from jobs where jobs.job_id=:new.job_id;
	select min_salary into minsal from jobs where jobs.job_id=:new.job_id;
	if :new.salary > maxsal or :new.salary < minsal then
		dbms_output.put_line('Error');
		raise_application_error(-20002,'sorry, such salary not permitted');
	end if;
end;
/

-- Question 9
select first_name||last_name as name, salary 
from employees 
where '31-12-1990' > hire_date and department_id=20;

declare
	cursor e is select * from employees;
	user_date varchar(20);
	user_dept int(10);
	records e%rowtype;
	n number := 0;
begin
	user_dept:=&dept;
	user_date:=&dat;
	open e;
	loop
		exit when e%notfound;
		fetch e into records;

		select count(*) into n from employees where employee_id=records.manager_id and department_id=user_dept;

		if n>0 and records.hire_date>to_date(user_date,'dd-mm-yyyy') then
			dbms_output.put_line(records.job_id || ' ' || records.first_name||records.last_name);
		end if;

	end loop;
	close e;
end;
/

-- Question 10
declare 
	cursor e is select employee_id, manager_id from employees;
	mgr_id employees.manager_id%type;
	emp_id employees.employee_id%type;
	n number;
begin
	open e;
	loop
		exit when e%notfound;
		fetch e into emp_id, mgr_id;

		select count(*) into n from employees where employee_id=mgr_id and last_name='king';

		if(n>0) then
			update employees set salary=salary*1.05 where employee_id=emp_id;
		end if;
	end loop;
	close e;
end;
/

-- Question 11
create or replace trigger deletefromemployee after delete on employees for each row
declare
   s_date date;
begin
	select sysdate into s_date from dual;
	insert into exemployee values (:old.employee_id,:old.first_name||' '||:old.last_name,:old.department_id,s_date);
end;
/

create or replace trigger insertintoemployeechange after update on employees for each row
declare
   v_username varchar2(10);
   s_date varchar(20);
begin
	select to_char(sysdate,'yyyy-mm-dd') into s_date from dual;
	v_username:='hr';
	if (:new.job_id<>:old.job_id and :new.department_id<>:old.department_id) then
		insert into employment_change values (:new.employee_id,:old.job_id,:new.job_id,:old.department_id,:new.department_id,v_username,sysdate,'both');
	elsif :new.job_id!=:old.job_id then
		insert into employment_change values (:new.employee_id,:old.job_id,:new.job_id,:old.department_id,:new.department_id,v_username,s_date,'job');
	elsif :new.department_id!=:old.department_id then
		insert into employment_change values (:new.employee_id,:old.job_id,:new.job_id,:old.department_id,:new.department_id,v_username,sysdate,'department');
	else
		dbms_output.put_line('not necessary to update anything');
	end if;
end;
/

-- Question 12
declare
procedure updatesalary(val in number, dept in number) is
	begin
		update employees set salary=salary+val where department_id=dept;
	end;
begin
	updatesalary(&sal,&x);
exception
	when no_data_found then
		dbms_output.put_line('please put a valid department id');
end;
/