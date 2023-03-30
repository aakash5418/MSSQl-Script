create table employee
(roll_no int identity (101,1) primary key,
employee_name varchar(50)Not Null,
department varchar(50),
dob date,
state varchar(50));

insert into employee values ('aakash','it','1998-04-11','chennai')
insert into employee values ('ravi','cs','1997-04-11','cbe')
insert into employee values ('ram','ec','1996-04-11','salem')
insert into employee values ('raghu','ai','1999-04-11','trichy')


select * from employee

create table department(
department_id int primary key,
salary int not null,
company_name varchar(50),
roll_no int foreign key references employee(roll_no));

insert into department values (1,1100,'zoho',101)
insert into department values (2,2100,'apple',102)
insert into department values (3,1500,'tcs',103)
insert into department values (4,4100,'amex',104)
insert into department values (5,1100,'zoho',101)

select * from employee
select * from department
select * from orders
create table orders(
order_id int  identity(901,1) primary key,
product_name varchar(50) not null,
delivery_address varchar(50) not null,
department_id int foreign key references department(department_id));

insert into orders values ('phone','chennai',1)
insert into orders values ('shirt','salem',2)
insert into orders values ('shoes','trichy',3)
insert into orders values ('tshirt','chennai',2)

select employee.roll_no,employee.employee_name,employee.dob,department.salary
from employee inner join department on employee.roll_no = department.roll_no


