use aaft;
create table employees(
    emp_id int not null primary key,
    first_name varchar(20) not null,
    last_name varchar(20),
    department varchar(20),
    salary int not null,
    hire_date date
    );
insert into employees(emp_id,first_name,last_name,department,salary,hire_date)values
(1,"john","doe","it",60000,"2019-01-10"),
(2,"jane","smith","hr",55000,"2018-03-05"),
(3,"emily","jones","it",62000,"2020-07-23"),
(4,"michale","brown","finance",70000,"2016-05-14"),
(5,"sarah","davis","finance",69000,"2017-11-18"),
(6,"david","johnson","hr",48000,"2021-09-10");

#1. Find the average salary of employees in each department.alter. 
select department,avg(salary) as average_salary from employees group by department;


#2. Find the total number of employees hired after 2019. 
select*from employees where hire_date>"2019-12-30";

#3. List the departments and the total salary of all employees in each department, ordered by the total salary. 
select emp_id,first_name,last_name,department,salary from employees order by salary;

#4. Find the highest salary in the Finance department.
select emp_id,first_name,salary from employees where department = "finance" order by salary desc limit 1;

#5. Get the top 3 highest-paid employees. 
select emp_id,first_name,salary from employees order by salary desc limit 3;

#6. Find the department with the minimum average salary. 
select department, avg(salary) as avg_salary from employees group by department order by avg_salary limit 1;

#7. Display the total number of employees in each department, ordered by the number of employees.
select department,count(emp_id) as number_employees  from employees group by department;

#8. Find the average salary of employees who were hired before 2020.
select emp_id,first_name,last_name,avg(salary) as avg_salary from employees where hire_date <"2020-01-01" group by emp_id;

#9. List the names of employees in the IT department ordered by hire date, with the most recently hired employees first.
select emp_id,first_name,last_name,hire_date from employees where department = "it" order by hire_date;

#10 . Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary. 
select sum(salary) AS total_salary from employees where hire_date > '2019-01-01';

#11. Get the employee with the lowest salary in the HR department. 
select emp_id,first_name,last_name,department,salary from employees where department = "hr" order by salary limit 1;

#12. Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments.
select emp_id,first_name,last_name,department,salary from employees order by salary desc limit 2;

#13. List all employees hired after 2018, ordered by salary, and show only the first 4 employees. 
select emp_id,first_name,last_name,department,salary,hire_date from employees where hire_date >"2018-12-31" order by salary limit 4;


#14. Find the highest salary in the IT department, but limit the results to the top 1 result.
select emp_id,first_name,last_name,department,salary from employees where department = "it" order by salary desc limit 1;

#15. Get the average salary of employees in each department and list only departments with an average salary greater than 60,000.
 select emp_id,first_name,last_name,department,avg(salary) as average_salary from employees group by emp_id,first_name,last_name,department having avg(salary)>60000;











