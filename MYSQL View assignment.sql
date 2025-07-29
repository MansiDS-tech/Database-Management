create database assignments;
use assignments;

create table employees(
emp_id int not null primary key,
name varchar(50),
department varchar(50),
position varchar(50),
salary int,
hire_date date,
age int 
);
drop table employees;

# 1. Basic Employee Info
CREATE VIEW Basic_Employee_Info AS
SELECT emp_ID, Name, Department
FROM Employees;

#2. IT Department
CREATE VIEW IT_Department AS
SELECT *
FROM Employees
WHERE Department = 'IT';

#3. Senior Employees
CREATE VIEW Senior_Employees AS
SELECT *
FROM Employees
WHERE Age > 45;

#4. High Salary Employees
CREATE VIEW High_Salary_Employees AS
SELECT Name, Position, Salary
FROM Employees
WHERE Salary > 70000;

#5. Recent Hires
CREATE VIEW Recent_Hires AS
SELECT *
FROM Employees
WHERE Hire_Date > '2023-01-01';

#6. Managers Only
CREATE VIEW Managers_Only AS
SELECT *
FROM Employees
WHERE Position LIKE '%Manager%';

#7. Department Wise Avg Salary
CREATE VIEW Department_Wise_Avg_Salary AS
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

#8. Young IT Managers
CREATE VIEW Young_IT_Managers AS
SELECT Name, Age
FROM Employees
WHERE Department = 'IT'
  AND Position = 'Manager'
  AND Age < 40;
  
  
 #9. Sorted By Salary
CREATE VIEW Sorted_By_Salary AS
SELECT *
FROM Employees
ORDER BY Salary DESC;

#10. Top Paid Employee
CREATE VIEW Top_Paid_Employee AS
SELECT *
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);
  


