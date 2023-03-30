create table student(
name varchar(255)unique,
city varchar(55),
age int,
rollno int identity(101,1) primary key)

create table fees (
id int  identity (1,1),
fees int,
rollno int foreign key references student(rollno))


insert into student values ('ram','chennai',21)
insert into student values ('ragu','cbe',22)
insert into student values ('raghul','salem',23)
insert into student values ('ravi','madhurai',24)

select * from student

insert into fees values (1000,101)
insert into fees values (2000,102)
insert into fees values (3000,103)
insert into fees values (4000,104)

select * from fees
select * from student

select * from fees where rollno=101