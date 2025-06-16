use venom;
create database venom;

create table Employees(
    emp_id int not null primary key,
    emp_name varchar(50) not null,
    department_id int not null
    );
    
insert into employees(emp_id,emp_name,department_id) values(1,"alice",10),(2,"bob",20),(3,"charlie",30),(4,"david",10),(5,"eve",40);

create table Departments(
    department_id int not null primary key,
    department_name varchar(50)
    );
    
insert into Departments(department_id,department_name) values(10,"hr"),(20,"finance"),(30,"it"),(40,"admin"),(50,"marketing");

create table Project(
    project_id int not null primary key,
    emp_id int not null,
    project_name varchar(20) not null
    );
    
insert into Project(project_id,emp_id,project_name) values(101,1,"alpha"),(102,2,"beta"),(103,3,"gama"),(104,4,"delta");

#1.	Write a query to get Employee and Department details using join.

select e.emp_id,e.emp_name,e.department_id,d.department_name 
from employees e inner join Departments d on e.department_id = d.department_id;

#2.	Write a query to retrieve all employees with their departments, even if the department is missing.

select e.emp_id,e.emp_name,d.department_name from 
employees e left join Departments d on e.department_id = d.department_id;

#3.	Write a query to get department details even if there are no employees in that department.

select e.emp_id,e.emp_name,e.department_id,d.department_name
from employees e right join Departments d on e.department_id = d.department_id;

#4.	Write a query to get all employees and departments, whether matched or not.

select e.emp_name,d.department_name from employees e
 right join Departments d on e.department_id = d.department_id;

#5.	JOIN three tables (Employees, Departments, Projects) to get employee, department, and project information. 
select e.emp_id,e.emp_name,e.department_id,d.department_name,p.project_id,p.project_name
from employees e inner join Departments d on e.department_id = d.department_id inner join project p on e.emp_id = p.emp_id;

#6.	Find employees who are not assigned to any projects.

select e.emp_id,e.emp_name,p.project_id from employees e
 left join project p on e.emp_id=p.emp_id where p.project_id is null;

#7.	Find departments with no employees using a RIGHT JOIN.

select d.department_id,d.department_name,e.emp_id from employees e 
right join Departments d on
e.department_id = d.department_id where e.emp_id is null;

#8.	Write a query to get Employee and Department details using join with aliases.

select e.emp_id, e.emp_name, d.department_id, d.department_name from employees e
inner join departments d on e.department_id = d.department_id;

#9.	Write a query to find projects managed by employees in the 'IT' department. 

select e.emp_id,e.emp_name,e.department_id,d.department_name,p.project_id,p.project_name
from employees e inner join Departments d 
on e.department_id = d.department_id inner join
project p on e.emp_id = p.emp_id where d.department_name = "it";

#10.Write a query to show employees and their project information (even if not assigned to a project).

select e.emp_id,e.emp_name,p.project_id from 
employees e left join project p on e.emp_id=p.emp_id ;

#11.Find employees who work in departments with names starting with 'A'.

select e.emp_id,e.emp_name,e.department_id,d.department_name from employees e
inner join Departments d on 
e.department_id = d.department_id where department_name like"a%";

#12.Find the total number of employees in each department using GROUP BY and JOIN

select d.department_id, count(e.emp_id) as total_employees from employees e
inner join Departments d on e.department_id = d.department_id group by d.department_id;

#13.Get the list of departments with more than one employee. 

select d.department_id, count(e.emp_id) as total_employees from employees e inner join 
Departments d on e.department_id = d.department_id group by
 d.department_id having count(e.emp_id)>1;


















    



