CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT,
    Revenue INT,
    SaleDate DATE
);
INSERT INTO EmployeeSales (SaleID, EmployeeName, Department, Product, Quantity, Revenue, SaleDate) VALUES
(1, 'John', 'IT', 'Laptop', 3, 3000, '2023-01-10'),
(2, 'Emma', 'HR', 'Printer', 2, 800, '2023-01-15'),
(3, 'Ava', 'IT', 'Laptop', 1, 1000, '2023-01-20'),
(4, 'Noah', 'Sales', 'Monitor', 4, 1200, '2023-02-01'),
(5, 'John', 'IT', 'Keyboard', 5, 500, '2023-02-05'),
(6, 'Emma', 'HR', 'Monitor', 1, 300, '2023-02-10'),
(7, 'Ava', 'Sales', 'Laptop', 2, 2000, '2023-02-15'),
(8, 'Noah', 'Sales', 'Printer', 3, 1200, '2023-02-20'),
(9, 'John', 'IT', 'Monitor', 2, 600, '2023-03-01'),
(10, 'Emma', 'HR', 'Laptop', 1, 1000, '2023-03-05');

#1. Add a row number to each sale based on the SaleDate in ascending order.
SELECT *, ROW_NUMBER() OVER (ORDER BY SaleDate) AS row_num
FROM EmployeeSales;

#2. Assign ranks to employees within each department based on their sale Revenue (highest first).
SELECT *, RANK() OVER (PARTITION BY Department ORDER BY Revenue DESC) AS rank_in_dept
FROM EmployeeSales;

#3. For each employee, calculate the cumulative (running) total of revenue ordered by SaleDate.
SELECT *, SUM(Revenue) OVER (PARTITION BY EmployeeName ORDER BY SaleDate) AS
running_total
FROM EmployeeSales;

#4. Show the difference in revenue between the current and previous sale made by the same
#employee.
SELECT *, Revenue - LAG(Revenue) OVER (PARTITION BY EmployeeName ORDER BY SaleDate) AS
revenue_diff
FROM EmployeeSales;

#5. Find the next product sold by each employee using the sale date.
SELECT *, LEAD(Product) OVER (PARTITION BY EmployeeName ORDER BY SaleDate) AS
next_product
FROM EmployeeSales;

#6. Display the first product sold by each employee.
SELECT *, FIRST_VALUE(Product) OVER (PARTITION BY EmployeeName ORDER BY SaleDate) AS
first_product
FROM EmployeeSales;

#7. Find the total revenue per department using SUM() as a window function.
SELECT *, SUM(Revenue) OVER (PARTITION BY Department) AS dept_total_revenue
FROM EmployeeSales;

#8. For each sale, calculate the average revenue of all previous sales (including current) using ROWS
#BETWEEN.
SELECT *, AVG(Revenue) OVER (ORDER BY SaleDate ROWS BETWEEN UNBOUNDED PRECEDING AND
CURRENT ROW) AS running_avg
FROM EmployeeSales;

#9. For each department, display the maximum revenue achieved so far by that employee till each sale.
SELECT *, MAX(Revenue) OVER (PARTITION BY EmployeeName, Department ORDER BY SaleDate
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS max_so_far
FROM EmployeeSales;

#10. Show the revenue gap between a sale and the average revenue for that department.
SELECT *, Revenue - AVG(Revenue) OVER (PARTITION BY Department) AS revenue_gap
FROM EmployeeSales;