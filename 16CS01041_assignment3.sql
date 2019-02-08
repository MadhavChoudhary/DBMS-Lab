use assignment3;

-- Drop tables
drop table job_history;
drop table departments;
drop table employees;
drop table jobs;
drop table locations;
drop table countries;
drop table regions;
drop view test6,test7,test13,test16;

-- Insert tables 
create table regions(
	region_id int not null,
	region_name varchar(30) not null,

	primary key(region_id)
);

create table countries(
  	country_id varchar(2) not null,
  	country_name varchar(30) default null,
  	region_id int default null,

  	primary key(country_id),
  	foreign key(region_id) references regions(region_id)
);

create table locations(
	location_id int not null,
	street_address varchar(30) not null,
	postal_code varchar(20) default null,
	city varchar(20) not null,
	state_province varchar(20) default null,
	country_id varchar(2) not null,

	primary key(location_id),
	foreign key(country_id) references countries(country_id)
);

create table jobs(
	job_id varchar(10) not null,
	job_title varchar(40) not null,
	min_salary int not null,
	max_salary int not null,

	primary key(job_id)
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
	department_id int default null,

	primary key(employee_id),
	foreign key(job_id) references jobs(job_id)
);

create table departments(
	department_id int not null,
	department_name varchar(30) not null,
	manager_id int default null,
	location_id int not null,

	primary key(department_id),
	foreign key(manager_id) references employees(employee_id),
	foreign key(location_id) references locations(location_id)
);

create table job_history(
	employee_id int not null,
	start_date varchar(15) not null,
	end_date varchar(15) not null,
	job_id varchar(10) not null,
	department_id int not null,

	primary key(employee_id, start_date),
	foreign key(employee_id) references employees(employee_id),
	foreign key(job_id) references jobs(job_id),
	foreign key(department_id) references departments(department_id)
);

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
select concat(e.first_name,' ',e.last_name) as emp_name, e.salary as monthly_pay, e.salary*12 as annual_pay,d.department_name 
from employees e 
inner join departments d on d.department_id=e.department_id 
order by e.salary desc;

-- +-------------------+-------------+------------+------------------+
-- | emp_name          | monthly_pay | annual_pay | department_name  |
-- +-------------------+-------------+------------+------------------+
-- | steven king       |       24000 |     288000 | executive        |
-- | neena kochhar     |       17000 |     204000 | executive        |
-- | lex de haan       |       17000 |     204000 | executive        |
-- | john russell      |       14000 |     168000 | sales            |
-- | karen partners    |       13500 |     162000 | sales            |
-- | michael hartstein |       13000 |     156000 | marketing        |
-- | nancy greenberg   |       12008 |     144096 | finance          |
-- | shelley higgins   |       12008 |     144096 | accounting       |
-- | alberto errazuriz |       12000 |     144000 | sales            |
-- | lisa ozer         |       11500 |     138000 | sales            |
-- | den raphaely      |       11000 |     132000 | purchasing       |
-- | gerald cambrault  |       11000 |     132000 | sales            |
-- | ellen abel        |       11000 |     132000 | sales            |
-- | eleni zlotkey     |       10500 |     126000 | sales            |
-- | clara vishney     |       10500 |     126000 | sales            |
-- | peter tucker      |       10000 |     120000 | sales            |
-- | janette king      |       10000 |     120000 | sales            |
-- | harrison bloom    |       10000 |     120000 | sales            |
-- | hermann baer      |       10000 |     120000 | public relations |
-- | tayler fox        |        9600 |     115200 | sales            |
-- | david bernstein   |        9500 |     114000 | sales            |
-- | patrick sully     |        9500 |     114000 | sales            |
-- | danielle greene   |        9500 |     114000 | sales            |
-- | alexander hunold  |        9000 |     108000 | it               |
-- | daniel faviet     |        9000 |     108000 | finance          |
-- | peter hall        |        9000 |     108000 | sales            |
-- | allan mcewen      |        9000 |     108000 | sales            |
-- | alyssa hutton     |        8800 |     105600 | sales            |
-- | jonathon taylor   |        8600 |     103200 | sales            |
-- | jack livingston   |        8400 |     100800 | sales            |
-- | william gietz     |        8300 |      99600 | accounting       |
-- | john chen         |        8200 |      98400 | finance          |
-- | adam fripp        |        8200 |      98400 | shipping         |
-- | matthew weiss     |        8000 |      96000 | shipping         |
-- | christophe olsen  |        8000 |      96000 | sales            |
-- | lindsey smith     |        8000 |      96000 | sales            |
-- | payam kaufling    |        7900 |      94800 | shipping         |
-- | jose manue urman  |        7800 |      93600 | finance          |
-- | ismael sciarra    |        7700 |      92400 | finance          |
-- | nanette cambrault |        7500 |      90000 | sales            |
-- | louise doran      |        7500 |      90000 | sales            |
-- | william smith     |        7400 |      88800 | sales            |
-- | elizabeth bates   |        7300 |      87600 | sales            |
-- | mattea marvins    |        7200 |      86400 | sales            |
-- | oliver tuvault    |        7000 |      84000 | sales            |
-- | sarath sewall     |        7000 |      84000 | sales            |
-- | luis popp         |        6900 |      82800 | finance          |
-- | david lee         |        6800 |      81600 | sales            |
-- | shanta vollman    |        6500 |      78000 | shipping         |
-- | susan mavris      |        6500 |      78000 | human resources  |
-- | sundar ande       |        6400 |      76800 | sales            |
-- | amit banda        |        6200 |      74400 | sales            |
-- | charles johnson   |        6200 |      74400 | sales            |
-- | sundita kumar     |        6100 |      73200 | sales            |
-- | bruce ernst       |        6000 |      72000 | it               |
-- | pat fay           |        6000 |      72000 | marketing        |
-- | kevin mourgos     |        5800 |      69600 | shipping         |
-- | david austin      |        4800 |      57600 | it               |
-- | valli pataballa   |        4800 |      57600 | it               |
-- | jennifer whalen   |        4400 |      52800 | administration   |
-- | diana lorentz     |        4200 |      50400 | it               |
-- | nandita sarchand  |        4200 |      50400 | shipping         |
-- | alexis bull       |        4100 |      49200 | shipping         |
-- | sarah bell        |        4000 |      48000 | shipping         |
-- | britney everett   |        3900 |      46800 | shipping         |
-- | kelly chung       |        3800 |      45600 | shipping         |
-- | renske ladwig     |        3600 |      43200 | shipping         |
-- | jennifer dilly    |        3600 |      43200 | shipping         |
-- | trenna rajs       |        3500 |      42000 | shipping         |
-- | julia dellinger   |        3400 |      40800 | shipping         |
-- | laura bissot      |        3300 |      39600 | shipping         |
-- | jason mallin      |        3300 |      39600 | shipping         |
-- | julia nayer       |        3200 |      38400 | shipping         |
-- | stephen stiles    |        3200 |      38400 | shipping         |
-- | winston taylor    |        3200 |      38400 | shipping         |
-- | samuel mccain     |        3200 |      38400 | shipping         |
-- | alexander khoo    |        3100 |      37200 | purchasing       |
-- | curtis davies     |        3100 |      37200 | shipping         |
-- | jean fleaur       |        3100 |      37200 | shipping         |
-- | alana walsh       |        3100 |      37200 | shipping         |
-- | anthony cabrio    |        3000 |      36000 | shipping         |
-- | kevin feeney      |        3000 |      36000 | shipping         |
-- | shelli baida      |        2900 |      34800 | purchasing       |
-- | michael rogers    |        2900 |      34800 | shipping         |
-- | timothy gates     |        2900 |      34800 | shipping         |
-- | sigal tobias      |        2800 |      33600 | purchasing       |
-- | mozhe atkinson    |        2800 |      33600 | shipping         |
-- | girard geoni      |        2800 |      33600 | shipping         |
-- | vance jones       |        2800 |      33600 | shipping         |
-- | irene mikkilinen  |        2700 |      32400 | shipping         |
-- | john seo          |        2700 |      32400 | shipping         |
-- | guy himuro        |        2600 |      31200 | purchasing       |
-- | randall matos     |        2600 |      31200 | shipping         |
-- | donald oconnell   |        2600 |      31200 | shipping         |
-- | douglas grant     |        2600 |      31200 | shipping         |
-- | karen colmenares  |        2500 |      30000 | purchasing       |
-- | james marlow      |        2500 |      30000 | shipping         |
-- | joshua patel      |        2500 |      30000 | shipping         |
-- | peter vargas      |        2500 |      30000 | shipping         |
-- | martha sullivan   |        2500 |      30000 | shipping         |
-- | randall perkins   |        2500 |      30000 | shipping         |
-- | james landry      |        2400 |      28800 | shipping         |
-- | ki gee            |        2400 |      28800 | shipping         |
-- | steven markle     |        2200 |      26400 | shipping         |
-- | hazel philtanker  |        2200 |      26400 | shipping         |
-- | tj olson          |        2100 |      25200 | shipping         |
-- +-------------------+-------------+------------+------------------+
-- 106 rows in set (0.00 sec)

-- Question 2
select concat(e.first_name,' ',e.last_name) as emp_name, e.salary*(1+e.commission_pct) as monthly_pay, e.salary*(12)*(1+e.commission_pct) as annual_pay,d.department_name 
from employees e 
inner join departments d on d.department_id=e.department_id 
order by e.salary desc;

-- +-------------------+--------------------+--------------------+------------------+
-- | emp_name          | monthly_pay        | annual_pay         | department_name  |
-- +-------------------+--------------------+--------------------+------------------+
-- | steven king       |              24000 |             288000 | executive        |
-- | neena kochhar     |              17000 |             204000 | executive        |
-- | lex de haan       |              17000 |             204000 | executive        |
-- | john russell      | 19600.000083446503 | 235200.00100135803 | sales            |
-- | karen partners    |  17550.00016093254 |  210600.0019311905 | sales            |
-- | michael hartstein |              13000 |             156000 | marketing        |
-- | nancy greenberg   |              12008 |             144096 | finance          |
-- | shelley higgins   |              12008 |             144096 | accounting       |
-- | alberto errazuriz | 15600.000143051147 | 187200.00171661377 | sales            |
-- | lisa ozer         |              14375 |             172500 | sales            |
-- | den raphaely      |              11000 |             132000 | purchasing       |
-- | gerald cambrault  | 14300.000131130219 | 171600.00157356262 | sales            |
-- | ellen abel        | 14300.000131130219 | 171600.00157356262 | sales            |
-- | eleni zlotkey     | 12600.000031292439 | 151200.00037550926 | sales            |
-- | clara vishney     |              13125 |             157500 | sales            |
-- | peter tucker      |  13000.00011920929 | 156000.00143051147 | sales            |
-- | janette king      | 13499.999940395355 | 161999.99928474426 | sales            |
-- | harrison bloom    | 12000.000029802322 | 144000.00035762787 | sales            |
-- | hermann baer      |              10000 |             120000 | public relations |
-- | tayler fox        |  11520.00002861023 | 138240.00034332275 | sales            |
-- | david bernstein   |              11875 |             142500 | sales            |
-- | patrick sully     | 12824.999943375587 | 153899.99932050705 | sales            |
-- | danielle greene   | 10925.000056624413 | 131100.00067949295 | sales            |
-- | alexander hunold  |               9000 |             108000 | it               |
-- | daniel faviet     |               9000 |             108000 | finance          |
-- | peter hall        |              11250 |             135000 | sales            |
-- | allan mcewen      |  12149.99994635582 | 145799.99935626984 | sales            |
-- | alyssa hutton     |              11000 |             132000 | sales            |
-- | jonathon taylor   | 10320.000025629997 | 123840.00030755997 | sales            |
-- | jack livingston   |  10080.00002503395 | 120960.00030040741 | sales            |
-- | william gietz     |               8300 |              99600 | accounting       |
-- | john chen         |               8200 |              98400 | finance          |
-- | adam fripp        |               8200 |              98400 | shipping         |
-- | matthew weiss     |               8000 |              96000 | shipping         |
-- | christophe olsen  |  9600.000023841858 |  115200.0002861023 | sales            |
-- | lindsey smith     | 10400.000095367432 | 124800.00114440918 | sales            |
-- | payam kaufling    |               7900 |              94800 | shipping         |
-- | jose manue urman  |               7800 |              93600 | finance          |
-- | ismael sciarra    |               7700 |              92400 | finance          |
-- | nanette cambrault |  9000.000022351742 |  108000.0002682209 | sales            |
-- | louise doran      |  9750.000089406967 |  117000.0010728836 | sales            |
-- | william smith     |  8510.000044107437 | 102120.00052928925 | sales            |
-- | elizabeth bates   |   8395.00004351139 | 100740.00052213669 | sales            |
-- | mattea marvins    |  7920.000010728836 |  95040.00012874603 | sales            |
-- | oliver tuvault    |  8050.000041723251 |  96600.00050067902 | sales            |
-- | sarath sewall     |               8750 |             105000 | sales            |
-- | luis popp         |               6900 |              82800 | finance          |
-- | david lee         |   7480.00001013279 |  89760.00012159348 | sales            |
-- | shanta vollman    |               6500 |              78000 | shipping         |
-- | susan mavris      |               6500 |              78000 | human resources  |
-- | sundar ande       |  7040.000009536743 |  84480.00011444092 | sales            |
-- | amit banda        |   6820.00000923872 |  81840.00011086464 | sales            |
-- | charles johnson   |   6820.00000923872 |  81840.00011086464 | sales            |
-- | sundita kumar     |  6710.000009089708 |   80520.0001090765 | sales            |
-- | bruce ernst       |               6000 |              72000 | it               |
-- | pat fay           |               6000 |              72000 | marketing        |
-- | kevin mourgos     |               5800 |              69600 | shipping         |
-- | david austin      |               4800 |              57600 | it               |
-- | valli pataballa   |               4800 |              57600 | it               |
-- | jennifer whalen   |               4400 |              52800 | administration   |
-- | diana lorentz     |               4200 |              50400 | it               |
-- | nandita sarchand  |               4200 |              50400 | shipping         |
-- | alexis bull       |               4100 |              49200 | shipping         |
-- | sarah bell        |               4000 |              48000 | shipping         |
-- | britney everett   |               3900 |              46800 | shipping         |
-- | kelly chung       |               3800 |              45600 | shipping         |
-- | renske ladwig     |               3600 |              43200 | shipping         |
-- | jennifer dilly    |               3600 |              43200 | shipping         |
-- | trenna rajs       |               3500 |              42000 | shipping         |
-- | julia dellinger   |               3400 |              40800 | shipping         |
-- | laura bissot      |               3300 |              39600 | shipping         |
-- | jason mallin      |               3300 |              39600 | shipping         |
-- | julia nayer       |               3200 |              38400 | shipping         |
-- | stephen stiles    |               3200 |              38400 | shipping         |
-- | winston taylor    |               3200 |              38400 | shipping         |
-- | samuel mccain     |               3200 |              38400 | shipping         |
-- | alexander khoo    |               3100 |              37200 | purchasing       |
-- | curtis davies     |               3100 |              37200 | shipping         |
-- | jean fleaur       |               3100 |              37200 | shipping         |
-- | alana walsh       |               3100 |              37200 | shipping         |
-- | anthony cabrio    |               3000 |              36000 | shipping         |
-- | kevin feeney      |               3000 |              36000 | shipping         |
-- | shelli baida      |               2900 |              34800 | purchasing       |
-- | michael rogers    |               2900 |              34800 | shipping         |
-- | timothy gates     |               2900 |              34800 | shipping         |
-- | sigal tobias      |               2800 |              33600 | purchasing       |
-- | mozhe atkinson    |               2800 |              33600 | shipping         |
-- | girard geoni      |               2800 |              33600 | shipping         |
-- | vance jones       |               2800 |              33600 | shipping         |
-- | irene mikkilinen  |               2700 |              32400 | shipping         |
-- | john seo          |               2700 |              32400 | shipping         |
-- | guy himuro        |               2600 |              31200 | purchasing       |
-- | randall matos     |               2600 |              31200 | shipping         |
-- | donald oconnell   |               2600 |              31200 | shipping         |
-- | douglas grant     |               2600 |              31200 | shipping         |
-- | karen colmenares  |               2500 |              30000 | purchasing       |
-- | james marlow      |               2500 |              30000 | shipping         |
-- | joshua patel      |               2500 |              30000 | shipping         |
-- | peter vargas      |               2500 |              30000 | shipping         |
-- | martha sullivan   |               2500 |              30000 | shipping         |
-- | randall perkins   |               2500 |              30000 | shipping         |
-- | james landry      |               2400 |              28800 | shipping         |
-- | ki gee            |               2400 |              28800 | shipping         |
-- | steven markle     |               2200 |              26400 | shipping         |
-- | hazel philtanker  |               2200 |              26400 | shipping         |
-- | tj olson          |               2100 |              25200 | shipping         |
-- +-------------------+--------------------+--------------------+------------------+
-- 106 rows in set (0.00 sec)

-- Question 3
select concat(e.first_name,' ',e.last_name) as emp_name, datediff(curdate(), str_to_date(hire_date, "%d-%b-%y"))/365 as experience 
from employees e 
order by experience desc;

-- +-------------------+------------+
-- | emp_name          | experience |
-- +-------------------+------------+
-- | lex de haan       |    18.0521 |
-- | susan mavris      |    16.6548 |
-- | hermann baer      |    16.6548 |
-- | shelley higgins   |    16.6548 |
-- | william gietz     |    16.6548 |
-- | daniel faviet     |    16.4630 |
-- | nancy greenberg   |    16.4603 |
-- | den raphaely      |    16.1534 |
-- | payam kaufling    |    15.7562 |
-- | alexander khoo    |    15.7096 |
-- | steven king       |    15.6274 |
-- | renske ladwig     |    15.5534 |
-- | jennifer whalen   |    15.3753 |
-- | trenna rajs       |    15.2932 |
-- | nandita sarchand  |    15.0137 |
-- | janette king      |    15.0055 |
-- | sarah bell        |    14.9918 |
-- | michael hartstein |    14.9562 |
-- | patrick sully     |    14.9123 |
-- | ellen abel        |    14.7260 |
-- | jason mallin      |    14.6329 |
-- | matthew weiss     |    14.5397 |
-- | allan mcewen      |    14.5014 |
-- | john russell      |    14.3342 |
-- | karen partners    |    14.0712 |
-- | curtis davies     |    14.0055 |
-- | peter tucker      |    14.0027 |
-- | james marlow      |    13.9562 |
-- | alexis bull       |    13.9452 |
-- | britney everett   |    13.9151 |
-- | alberto errazuriz |    13.8959 |
-- | lindsey smith     |    13.8959 |
-- | lisa ozer         |    13.8932 |
-- | alyssa hutton     |    13.8712 |
-- | david bernstein   |    13.8575 |
-- | adam fripp        |    13.8110 |
-- | kelly chung       |    13.6329 |
-- | david austin      |    13.6027 |
-- | julia nayer       |    13.5452 |
-- | sigal tobias      |    13.5233 |
-- | jennifer dilly    |    13.4685 |
-- | pat fay           |    13.4575 |
-- | laura bissot      |    13.4493 |
-- | peter hall        |    13.4493 |
-- | neena kochhar     |    13.3616 |
-- | john chen         |    13.3425 |
-- | ismael sciarra    |    13.3370 |
-- | shanta vollman    |    13.3096 |
-- | stephen stiles    |    13.2658 |
-- | mozhe atkinson    |    13.2548 |
-- | clara vishney     |    13.2219 |
-- | louise doran      |    13.1288 |
-- | shelli baida      |    13.1041 |
-- | alexander hunold  |    13.0767 |
-- | tayler fox        |    13.0192 |
-- | winston taylor    |    13.0192 |
-- | valli pataballa   |    12.9863 |
-- | john seo          |    12.9671 |
-- | jean fleaur       |    12.9370 |
-- | jose manue urman  |    12.9041 |
-- | randall matos     |    12.8822 |
-- | harrison bloom    |    12.8603 |
-- | jonathon taylor   |    12.8575 |
-- | christophe olsen  |    12.8411 |
-- | joshua patel      |    12.8219 |
-- | jack livingston   |    12.7753 |
-- | alana walsh       |    12.7726 |
-- | kevin feeney      |    12.6932 |
-- | julia dellinger   |    12.6055 |
-- | samuel mccain     |    12.5863 |
-- | peter vargas      |    12.5644 |
-- | timothy gates     |    12.5589 |
-- | michael rogers    |    12.4329 |
-- | irene mikkilinen  |    12.3425 |
-- | sarath sewall     |    12.2438 |
-- | guy himuro        |    12.2110 |
-- | nanette cambrault |    12.1452 |
-- | james landry      |    12.0466 |
-- | diana lorentz     |    11.9808 |
-- | anthony cabrio    |    11.9808 |
-- | william smith     |    11.9370 |
-- | vance jones       |    11.8767 |
-- | danielle greene   |    11.8712 |
-- | elizabeth bates   |    11.8575 |
-- | tj olson          |    11.8110 |
-- | bruce ernst       |    11.6986 |
-- | kimberely grant   |    11.6904 |
-- | martha sullivan   |    11.6137 |
-- | donald oconnell   |    11.6137 |
-- | karen colmenares  |    11.4767 |
-- | gerald cambrault  |    11.2959 |
-- | kevin mourgos     |    11.2082 |
-- | oliver tuvault    |    11.1890 |
-- | luis popp         |    11.1507 |
-- | ki gee            |    11.1370 |
-- | randall perkins   |    11.1178 |
-- | charles johnson   |    11.0740 |
-- | douglas grant     |    11.0493 |
-- | mattea marvins    |    11.0192 |
-- | eleni zlotkey     |    11.0055 |
-- | girard geoni      |    10.9918 |
-- | hazel philtanker  |    10.9836 |
-- | david lee         |    10.9370 |
-- | steven markle     |    10.8986 |
-- | sundar ande       |    10.8548 |
-- | amit banda        |    10.7781 |
-- | sundita kumar     |    10.7781 |
-- +-------------------+------------+
-- 107 rows in set (0.00 sec)

-- Question 4
select concat(e.first_name,' ',e.last_name) as name, e.salary as old_salary, 
	case when e.department_id=90 then e.salary*1.1 else e.salary end as new_salary 
from employees e;

-- +-------------------+------------+------------+
-- | name              | old_salary | new_salary |
-- +-------------------+------------+------------+
-- | steven king       |      24000 |    26400.0 |
-- | neena kochhar     |      17000 |    18700.0 |
-- | lex de haan       |      17000 |    18700.0 |
-- | alexander hunold  |       9000 |       9000 |
-- | bruce ernst       |       6000 |       6000 |
-- | david austin      |       4800 |       4800 |
-- | valli pataballa   |       4800 |       4800 |
-- | diana lorentz     |       4200 |       4200 |
-- | nancy greenberg   |      12008 |      12008 |
-- | daniel faviet     |       9000 |       9000 |
-- | john chen         |       8200 |       8200 |
-- | ismael sciarra    |       7700 |       7700 |
-- | jose manue urman  |       7800 |       7800 |
-- | luis popp         |       6900 |       6900 |
-- | den raphaely      |      11000 |      11000 |
-- | alexander khoo    |       3100 |       3100 |
-- | shelli baida      |       2900 |       2900 |
-- | sigal tobias      |       2800 |       2800 |
-- | guy himuro        |       2600 |       2600 |
-- | karen colmenares  |       2500 |       2500 |
-- | matthew weiss     |       8000 |       8000 |
-- | adam fripp        |       8200 |       8200 |
-- | payam kaufling    |       7900 |       7900 |
-- | shanta vollman    |       6500 |       6500 |
-- | kevin mourgos     |       5800 |       5800 |
-- | julia nayer       |       3200 |       3200 |
-- | irene mikkilinen  |       2700 |       2700 |
-- | james landry      |       2400 |       2400 |
-- | steven markle     |       2200 |       2200 |
-- | laura bissot      |       3300 |       3300 |
-- | mozhe atkinson    |       2800 |       2800 |
-- | james marlow      |       2500 |       2500 |
-- | tj olson          |       2100 |       2100 |
-- | jason mallin      |       3300 |       3300 |
-- | michael rogers    |       2900 |       2900 |
-- | ki gee            |       2400 |       2400 |
-- | hazel philtanker  |       2200 |       2200 |
-- | renske ladwig     |       3600 |       3600 |
-- | stephen stiles    |       3200 |       3200 |
-- | john seo          |       2700 |       2700 |
-- | joshua patel      |       2500 |       2500 |
-- | trenna rajs       |       3500 |       3500 |
-- | curtis davies     |       3100 |       3100 |
-- | randall matos     |       2600 |       2600 |
-- | peter vargas      |       2500 |       2500 |
-- | john russell      |      14000 |      14000 |
-- | karen partners    |      13500 |      13500 |
-- | alberto errazuriz |      12000 |      12000 |
-- | gerald cambrault  |      11000 |      11000 |
-- | eleni zlotkey     |      10500 |      10500 |
-- | peter tucker      |      10000 |      10000 |
-- | david bernstein   |       9500 |       9500 |
-- | peter hall        |       9000 |       9000 |
-- | christophe olsen  |       8000 |       8000 |
-- | nanette cambrault |       7500 |       7500 |
-- | oliver tuvault    |       7000 |       7000 |
-- | janette king      |      10000 |      10000 |
-- | patrick sully     |       9500 |       9500 |
-- | allan mcewen      |       9000 |       9000 |
-- | lindsey smith     |       8000 |       8000 |
-- | louise doran      |       7500 |       7500 |
-- | sarath sewall     |       7000 |       7000 |
-- | clara vishney     |      10500 |      10500 |
-- | danielle greene   |       9500 |       9500 |
-- | mattea marvins    |       7200 |       7200 |
-- | david lee         |       6800 |       6800 |
-- | sundar ande       |       6400 |       6400 |
-- | amit banda        |       6200 |       6200 |
-- | lisa ozer         |      11500 |      11500 |
-- | harrison bloom    |      10000 |      10000 |
-- | tayler fox        |       9600 |       9600 |
-- | william smith     |       7400 |       7400 |
-- | elizabeth bates   |       7300 |       7300 |
-- | sundita kumar     |       6100 |       6100 |
-- | ellen abel        |      11000 |      11000 |
-- | alyssa hutton     |       8800 |       8800 |
-- | jonathon taylor   |       8600 |       8600 |
-- | jack livingston   |       8400 |       8400 |
-- | kimberely grant   |       7000 |       7000 |
-- | charles johnson   |       6200 |       6200 |
-- | winston taylor    |       3200 |       3200 |
-- | jean fleaur       |       3100 |       3100 |
-- | martha sullivan   |       2500 |       2500 |
-- | girard geoni      |       2800 |       2800 |
-- | nandita sarchand  |       4200 |       4200 |
-- | alexis bull       |       4100 |       4100 |
-- | julia dellinger   |       3400 |       3400 |
-- | anthony cabrio    |       3000 |       3000 |
-- | kelly chung       |       3800 |       3800 |
-- | jennifer dilly    |       3600 |       3600 |
-- | timothy gates     |       2900 |       2900 |
-- | randall perkins   |       2500 |       2500 |
-- | sarah bell        |       4000 |       4000 |
-- | britney everett   |       3900 |       3900 |
-- | samuel mccain     |       3200 |       3200 |
-- | vance jones       |       2800 |       2800 |
-- | alana walsh       |       3100 |       3100 |
-- | kevin feeney      |       3000 |       3000 |
-- | donald oconnell   |       2600 |       2600 |
-- | douglas grant     |       2600 |       2600 |
-- | jennifer whalen   |       4400 |       4400 |
-- | michael hartstein |      13000 |      13000 |
-- | pat fay           |       6000 |       6000 |
-- | susan mavris      |       6500 |       6500 |
-- | hermann baer      |      10000 |      10000 |
-- | shelley higgins   |      12008 |      12008 |
-- | william gietz     |       8300 |       8300 |
-- +-------------------+------------+------------+
-- 107 rows in set (0.00 sec)

-- Question 5
select e.department_id,d.department_name,sum(e.salary) as total_salary 
from employees e,departments d 
where e.department_id=d.department_id 
group by e.department_id 
having total_salary>100000;

-- +---------------+-----------------+--------------+
-- | department_id | department_name | total_salary |
-- +---------------+-----------------+--------------+
-- |            50 | shipping        |       156400 |
-- |            80 | sales           |       304500 |
-- +---------------+-----------------+--------------+
-- 2 rows in set (0.00 sec)

-- Question 6
create view test6 as 
	select e1.job_id, concat(e1.first_name,' ',e1.last_name) as max_salary, concat(e2.first_name,' ',e2.last_name) as min_salary 
	from employees e1, employees e2 
	where (e1.job_id, e1.salary) in (select job_id,max(salary) from employees group by job_id) 
	and (e2.job_id, e2.salary) in (select job_id,min(salary) from employees group by job_id) and e1.job_id=e2.job_id;
select * from test6;

-- +------------+-------------------+-------------------+
-- | job_id     | max_salary        | min_salary        |
-- +------------+-------------------+-------------------+
-- | ad_pres    | steven king       | steven king       |
-- | ad_vp      | neena kochhar     | neena kochhar     |
-- | ad_vp      | neena kochhar     | lex de haan       |
-- | ad_vp      | lex de haan       | neena kochhar     |
-- | ad_vp      | lex de haan       | lex de haan       |
-- | it_prog    | alexander hunold  | diana lorentz     |
-- | fi_mgr     | nancy greenberg   | nancy greenberg   |
-- | fi_account | daniel faviet     | luis popp         |
-- | pu_man     | den raphaely      | den raphaely      |
-- | pu_clerk   | alexander khoo    | karen colmenares  |
-- | st_man     | adam fripp        | kevin mourgos     |
-- | st_clerk   | renske ladwig     | tj olson          |
-- | sa_man     | john russell      | eleni zlotkey     |
-- | sa_rep     | lisa ozer         | sundita kumar     |
-- | sh_clerk   | nandita sarchand  | martha sullivan   |
-- | sh_clerk   | nandita sarchand  | randall perkins   |
-- | ad_asst    | jennifer whalen   | jennifer whalen   |
-- | mk_man     | michael hartstein | michael hartstein |
-- | mk_rep     | pat fay           | pat fay           |
-- | hr_rep     | susan mavris      | susan mavris      |
-- | pr_rep     | hermann baer      | hermann baer      |
-- | ac_mgr     | shelley higgins   | shelley higgins   |
-- | ac_account | william gietz     | william gietz     |
-- +------------+-------------------+-------------------+
-- 23 rows in set (0.00 sec)

-- Question 7
create view test7 as 
	select e.employee_id,d.department_name,l.city,c.country_name 
	from employees e,departments d, locations l, countries c 
	where e.department_id=d.department_id and d.location_id=l.location_id and l.country_id=c.country_id;
select * from test7;

-- +-------------+------------------+-----------------+--------------------------+
-- | employee_id | department_name  | city            | country_name             |
-- +-------------+------------------+-----------------+--------------------------+
-- |         100 | executive        | seattle         | united states of america |
-- |         101 | executive        | seattle         | united states of america |
-- |         102 | executive        | seattle         | united states of america |
-- |         103 | it               | southlake       | united states of america |
-- |         104 | it               | southlake       | united states of america |
-- |         105 | it               | southlake       | united states of america |
-- |         106 | it               | southlake       | united states of america |
-- |         107 | it               | southlake       | united states of america |
-- |         108 | finance          | seattle         | united states of america |
-- |         109 | finance          | seattle         | united states of america |
-- |         110 | finance          | seattle         | united states of america |
-- |         111 | finance          | seattle         | united states of america |
-- |         112 | finance          | seattle         | united states of america |
-- |         113 | finance          | seattle         | united states of america |
-- |         114 | purchasing       | seattle         | united states of america |
-- |         115 | purchasing       | seattle         | united states of america |
-- |         116 | purchasing       | seattle         | united states of america |
-- |         117 | purchasing       | seattle         | united states of america |
-- |         118 | purchasing       | seattle         | united states of america |
-- |         119 | purchasing       | seattle         | united states of america |
-- |         120 | shipping         | south san franc | united states of america |
-- |         121 | shipping         | south san franc | united states of america |
-- |         122 | shipping         | south san franc | united states of america |
-- |         123 | shipping         | south san franc | united states of america |
-- |         124 | shipping         | south san franc | united states of america |
-- |         125 | shipping         | south san franc | united states of america |
-- |         126 | shipping         | south san franc | united states of america |
-- |         127 | shipping         | south san franc | united states of america |
-- |         128 | shipping         | south san franc | united states of america |
-- |         129 | shipping         | south san franc | united states of america |
-- |         130 | shipping         | south san franc | united states of america |
-- |         131 | shipping         | south san franc | united states of america |
-- |         132 | shipping         | south san franc | united states of america |
-- |         133 | shipping         | south san franc | united states of america |
-- |         134 | shipping         | south san franc | united states of america |
-- |         135 | shipping         | south san franc | united states of america |
-- |         136 | shipping         | south san franc | united states of america |
-- |         137 | shipping         | south san franc | united states of america |
-- |         138 | shipping         | south san franc | united states of america |
-- |         139 | shipping         | south san franc | united states of america |
-- |         140 | shipping         | south san franc | united states of america |
-- |         141 | shipping         | south san franc | united states of america |
-- |         142 | shipping         | south san franc | united states of america |
-- |         143 | shipping         | south san franc | united states of america |
-- |         144 | shipping         | south san franc | united states of america |
-- |         145 | sales            | oxford          | united kingdom           |
-- |         146 | sales            | oxford          | united kingdom           |
-- |         147 | sales            | oxford          | united kingdom           |
-- |         148 | sales            | oxford          | united kingdom           |
-- |         149 | sales            | oxford          | united kingdom           |
-- |         150 | sales            | oxford          | united kingdom           |
-- |         151 | sales            | oxford          | united kingdom           |
-- |         152 | sales            | oxford          | united kingdom           |
-- |         153 | sales            | oxford          | united kingdom           |
-- |         154 | sales            | oxford          | united kingdom           |
-- |         155 | sales            | oxford          | united kingdom           |
-- |         156 | sales            | oxford          | united kingdom           |
-- |         157 | sales            | oxford          | united kingdom           |
-- |         158 | sales            | oxford          | united kingdom           |
-- |         159 | sales            | oxford          | united kingdom           |
-- |         160 | sales            | oxford          | united kingdom           |
-- |         161 | sales            | oxford          | united kingdom           |
-- |         162 | sales            | oxford          | united kingdom           |
-- |         163 | sales            | oxford          | united kingdom           |
-- |         164 | sales            | oxford          | united kingdom           |
-- |         165 | sales            | oxford          | united kingdom           |
-- |         166 | sales            | oxford          | united kingdom           |
-- |         167 | sales            | oxford          | united kingdom           |
-- |         168 | sales            | oxford          | united kingdom           |
-- |         169 | sales            | oxford          | united kingdom           |
-- |         170 | sales            | oxford          | united kingdom           |
-- |         171 | sales            | oxford          | united kingdom           |
-- |         172 | sales            | oxford          | united kingdom           |
-- |         173 | sales            | oxford          | united kingdom           |
-- |         174 | sales            | oxford          | united kingdom           |
-- |         175 | sales            | oxford          | united kingdom           |
-- |         176 | sales            | oxford          | united kingdom           |
-- |         177 | sales            | oxford          | united kingdom           |
-- |         179 | sales            | oxford          | united kingdom           |
-- |         180 | shipping         | south san franc | united states of america |
-- |         181 | shipping         | south san franc | united states of america |
-- |         182 | shipping         | south san franc | united states of america |
-- |         183 | shipping         | south san franc | united states of america |
-- |         184 | shipping         | south san franc | united states of america |
-- |         185 | shipping         | south san franc | united states of america |
-- |         186 | shipping         | south san franc | united states of america |
-- |         187 | shipping         | south san franc | united states of america |
-- |         188 | shipping         | south san franc | united states of america |
-- |         189 | shipping         | south san franc | united states of america |
-- |         190 | shipping         | south san franc | united states of america |
-- |         191 | shipping         | south san franc | united states of america |
-- |         192 | shipping         | south san franc | united states of america |
-- |         193 | shipping         | south san franc | united states of america |
-- |         194 | shipping         | south san franc | united states of america |
-- |         195 | shipping         | south san franc | united states of america |
-- |         196 | shipping         | south san franc | united states of america |
-- |         197 | shipping         | south san franc | united states of america |
-- |         198 | shipping         | south san franc | united states of america |
-- |         199 | shipping         | south san franc | united states of america |
-- |         200 | administration   | seattle         | united states of america |
-- |         201 | marketing        | toronto         | canada                   |
-- |         202 | marketing        | toronto         | canada                   |
-- |         203 | human resources  | london          | united kingdom           |
-- |         204 | public relations | munich          | germany                  |
-- |         205 | accounting       | seattle         | united states of america |
-- |         206 | accounting       | seattle         | united states of america |
-- +-------------+------------------+-----------------+--------------------------+
-- 106 rows in set (0.00 sec)

-- Question 8
select department_id, right(hire_date,2), count(employee_id) 
from employees 
where department_id is not null 
group by department_id,right(hire_date,2) 
order by department_id, right(hire_date,2);

-- +---------------+--------------------+--------------------+
-- | department_id | right(hire_date,2) | count(employee_id) |
-- +---------------+--------------------+--------------------+
-- |            10 | 03                 |                  1 |
-- |            20 | 04                 |                  1 |
-- |            20 | 05                 |                  1 |
-- |            30 | 02                 |                  1 |
-- |            30 | 03                 |                  1 |
-- |            30 | 05                 |                  2 |
-- |            30 | 06                 |                  1 |
-- |            30 | 07                 |                  1 |
-- |            40 | 02                 |                  1 |
-- |            50 | 03                 |                  3 |
-- |            50 | 04                 |                  4 |
-- |            50 | 05                 |                 12 |
-- |            50 | 06                 |                 13 |
-- |            50 | 07                 |                  9 |
-- |            50 | 08                 |                  4 |
-- |            60 | 05                 |                  1 |
-- |            60 | 06                 |                  2 |
-- |            60 | 07                 |                  2 |
-- |            70 | 02                 |                  1 |
-- |            80 | 04                 |                  5 |
-- |            80 | 05                 |                 10 |
-- |            80 | 06                 |                  7 |
-- |            80 | 07                 |                  5 |
-- |            80 | 08                 |                  7 |
-- |            90 | 01                 |                  1 |
-- |            90 | 03                 |                  1 |
-- |            90 | 05                 |                  1 |
-- |           100 | 02                 |                  2 |
-- |           100 | 05                 |                  2 |
-- |           100 | 06                 |                  1 |
-- |           100 | 07                 |                  1 |
-- |           110 | 02                 |                  2 |
-- +---------------+--------------------+--------------------+
-- 32 rows in set (0.00 sec)

-- Question 9
select concat(e.first_name,' ',e.last_name) 
from employees e, employees m 
where e.manager_id=m.employee_id and datediff(str_to_date(e.hire_date, '%d-%b-%y'), str_to_date(m.hire_date, '%d-%b-%y'))<0;

-- +--------------------------------------+
-- | concat(e.first_name,' ',e.last_name) |
-- +--------------------------------------+
-- | lex de haan                          |
-- | david austin                         |
-- | nancy greenberg                      |
-- | daniel faviet                        |
-- | den raphaely                         |
-- | payam kaufling                       |
-- | james marlow                         |
-- | renske ladwig                        |
-- | trenna rajs                          |
-- | curtis davies                        |
-- | randall matos                        |
-- | peter vargas                         |
-- | janette king                         |
-- | patrick sully                        |
-- | allan mcewen                         |
-- | lisa ozer                            |
-- | harrison bloom                       |
-- | tayler fox                           |
-- | william smith                        |
-- | elizabeth bates                      |
-- | ellen abel                           |
-- | alyssa hutton                        |
-- | jonathon taylor                      |
-- | jack livingston                      |
-- | kimberely grant                      |
-- | charles johnson                      |
-- | nandita sarchand                     |
-- | alexis bull                          |
-- | sarah bell                           |
-- | britney everett                      |
-- | alana walsh                          |
-- | kevin feeney                         |
-- | donald oconnell                      |
-- | jennifer whalen                      |
-- | susan mavris                         |
-- | hermann baer                         |
-- | shelley higgins                      |
-- +--------------------------------------+
-- 37 rows in set (0.00 sec)

-- Question 10
select c.country_name, l.city , count(e.department_id) 
from employees e, departments d, locations l, countries c 
where e.department_id=d.department_id and d.location_id=l.location_id and c.country_id=l.country_id 
group by e.department_id 
having count(e.department_id)>5;

-- +--------------------------+-----------------+------------------------+
-- | country_name             | city            | count(e.department_id) |
-- +--------------------------+-----------------+------------------------+
-- | united states of america | seattle         |                      6 |
-- | united states of america | seattle         |                      6 |
-- | united states of america | south san franc |                     45 |
-- | united kingdom           | oxford          |                     34 |
-- +--------------------------+-----------------+------------------------+
-- 4 rows in set (0.00 sec)

-- Question 11
select concat(first_name,' ',last_name) as name, salary 
from employees 
where manager_id in (select manager_id from employees group by manager_id having count(manager_id)>5);

-- +-------------------+--------+
-- | name              | salary |
-- +-------------------+--------+
-- | neena kochhar     |  17000 |
-- | lex de haan       |  17000 |
-- | den raphaely      |  11000 |
-- | matthew weiss     |   8000 |
-- | adam fripp        |   8200 |
-- | payam kaufling    |   7900 |
-- | shanta vollman    |   6500 |
-- | kevin mourgos     |   5800 |
-- | julia nayer       |   3200 |
-- | irene mikkilinen  |   2700 |
-- | james landry      |   2400 |
-- | steven markle     |   2200 |
-- | laura bissot      |   3300 |
-- | mozhe atkinson    |   2800 |
-- | james marlow      |   2500 |
-- | tj olson          |   2100 |
-- | jason mallin      |   3300 |
-- | michael rogers    |   2900 |
-- | ki gee            |   2400 |
-- | hazel philtanker  |   2200 |
-- | renske ladwig     |   3600 |
-- | stephen stiles    |   3200 |
-- | john seo          |   2700 |
-- | joshua patel      |   2500 |
-- | trenna rajs       |   3500 |
-- | curtis davies     |   3100 |
-- | randall matos     |   2600 |
-- | peter vargas      |   2500 |
-- | john russell      |  14000 |
-- | karen partners    |  13500 |
-- | alberto errazuriz |  12000 |
-- | gerald cambrault  |  11000 |
-- | eleni zlotkey     |  10500 |
-- | peter tucker      |  10000 |
-- | david bernstein   |   9500 |
-- | peter hall        |   9000 |
-- | christophe olsen  |   8000 |
-- | nanette cambrault |   7500 |
-- | oliver tuvault    |   7000 |
-- | janette king      |  10000 |
-- | patrick sully     |   9500 |
-- | allan mcewen      |   9000 |
-- | lindsey smith     |   8000 |
-- | louise doran      |   7500 |
-- | sarath sewall     |   7000 |
-- | clara vishney     |  10500 |
-- | danielle greene   |   9500 |
-- | mattea marvins    |   7200 |
-- | david lee         |   6800 |
-- | sundar ande       |   6400 |
-- | amit banda        |   6200 |
-- | lisa ozer         |  11500 |
-- | harrison bloom    |  10000 |
-- | tayler fox        |   9600 |
-- | william smith     |   7400 |
-- | elizabeth bates   |   7300 |
-- | sundita kumar     |   6100 |
-- | ellen abel        |  11000 |
-- | alyssa hutton     |   8800 |
-- | jonathon taylor   |   8600 |
-- | jack livingston   |   8400 |
-- | kimberely grant   |   7000 |
-- | charles johnson   |   6200 |
-- | winston taylor    |   3200 |
-- | jean fleaur       |   3100 |
-- | martha sullivan   |   2500 |
-- | girard geoni      |   2800 |
-- | nandita sarchand  |   4200 |
-- | alexis bull       |   4100 |
-- | julia dellinger   |   3400 |
-- | anthony cabrio    |   3000 |
-- | kelly chung       |   3800 |
-- | jennifer dilly    |   3600 |
-- | timothy gates     |   2900 |
-- | randall perkins   |   2500 |
-- | sarah bell        |   4000 |
-- | britney everett   |   3900 |
-- | samuel mccain     |   3200 |
-- | vance jones       |   2800 |
-- | alana walsh       |   3100 |
-- | kevin feeney      |   3000 |
-- | donald oconnell   |   2600 |
-- | douglas grant     |   2600 |
-- | michael hartstein |  13000 |
-- +-------------------+--------+
-- 84 rows in set (0.00 sec)

-- Question 12
update employees set salary=
	(case when datediff(curdate(), str_to_date(hire_date, '%d-%b-%y'))/365 > 10 then salary*1.2 
		when datediff(curdate(), str_to_date(hire_date, '%d-%b-%y'))/365 > 5 then salary*1.1 
		else salary*1.05 
	end);

-- Question 13
create view test13 as 
	select right(hire_date,2) as year, count(employee_id) as cnt 
	from employees 
	group by right(hire_date,2);
select year from test13 where cnt in (select max(cnt) from test13);

-- +------+
-- | year |
-- +------+
-- | 05   |
-- +------+
-- 1 row in set (0.00 sec)

-- Question 14
select employee_id,department_id 
from employees 
where department_id=10 and salary>(select min(salary) from employees where department_id=30);

-- +-------------+---------------+
-- | employee_id | department_id |
-- +-------------+---------------+
-- |         200 |            10 |
-- +-------------+---------------+
-- 1 row in set (0.00 sec)

-- Question 15
select concat(e1.first_name,' ',e1.last_name) as name, e1.salary 
from employees e1, employees e2 
where e1.salary<e2.salary 
group by e1.employee_id 
having count(*)>(select count(*) from employees)/2;

-- +------------------+--------+
-- | name             | salary |
-- +------------------+--------+
-- | bruce ernst      |   7200 |
-- | david austin     |   5760 |
-- | valli pataballa  |   5760 |
-- | diana lorentz    |   5040 |
-- | alexander khoo   |   3720 |
-- | shelli baida     |   3480 |
-- | sigal tobias     |   3360 |
-- | guy himuro       |   3120 |
-- | karen colmenares |   3000 |
-- | kevin mourgos    |   6960 |
-- | julia nayer      |   3840 |
-- | irene mikkilinen |   3240 |
-- | james landry     |   2880 |
-- | steven markle    |   2640 |
-- | laura bissot     |   3960 |
-- | mozhe atkinson   |   3360 |
-- | james marlow     |   3000 |
-- | tj olson         |   2520 |
-- | jason mallin     |   3960 |
-- | michael rogers   |   3480 |
-- | ki gee           |   2880 |
-- | hazel philtanker |   2640 |
-- | renske ladwig    |   4320 |
-- | stephen stiles   |   3840 |
-- | john seo         |   3240 |
-- | joshua patel     |   3000 |
-- | trenna rajs      |   4200 |
-- | curtis davies    |   3720 |
-- | randall matos    |   3120 |
-- | peter vargas     |   3000 |
-- | sundita kumar    |   7320 |
-- | winston taylor   |   3840 |
-- | jean fleaur      |   3720 |
-- | martha sullivan  |   3000 |
-- | girard geoni     |   3360 |
-- | nandita sarchand |   5040 |
-- | alexis bull      |   4920 |
-- | julia dellinger  |   4080 |
-- | anthony cabrio   |   3600 |
-- | kelly chung      |   4560 |
-- | jennifer dilly   |   4320 |
-- | timothy gates    |   3480 |
-- | randall perkins  |   3000 |
-- | sarah bell       |   4800 |
-- | britney everett  |   4680 |
-- | samuel mccain    |   3840 |
-- | vance jones      |   3360 |
-- | alana walsh      |   3720 |
-- | kevin feeney     |   3600 |
-- | donald oconnell  |   3120 |
-- | douglas grant    |   3120 |
-- | jennifer whalen  |   5280 |
-- | pat fay          |   7200 |
-- +------------------+--------+
-- 53 rows in set (0.01 sec)

-- Question 16
create view test16 as 
	select concat(e.first_name,' ',e.last_name) as emp_name, j.job_title, e.salary*(12)*(1+e.commission_pct) as annual_salary 
	from employees e, jobs j 
	where j.job_id=e.job_id and e.department_id=20;
select * from test16;

-- +-------------------+--------------------------+---------------+
-- | emp_name          | job_title                | annual_salary |
-- +-------------------+--------------------------+---------------+
-- | michael hartstein | marketing manager        |        187200 |
-- | pat fay           | marketing representative |         86400 |
-- +-------------------+--------------------------+---------------+
-- 2 rows in set (0.00 sec)