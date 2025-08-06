
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 1. Function: Get price of a product by ID
DELIMITER //
CREATE FUNCTION get_product_price(pid INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE p_price DECIMAL(10,2);
    SELECT Price INTO p_price FROM Products WHERE ProductID = pid;
    RETURN p_price;
END//
DELIMITER ;

-- 2. Function: Calculate total sales for a product
DELIMITER //
CREATE FUNCTION total_sales_product(pid INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Quantity * Price) INTO total
    FROM Sales s
    JOIN Products p ON s.ProductID = p.ProductID
    WHERE s.ProductID = pid;
    RETURN IFNULL(total,0);
END//
DELIMITER ;

-- 3. Function: Get available stock for a product
DELIMITER //
CREATE FUNCTION get_stock(pid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE qty INT;
    SELECT Stock INTO qty FROM Products WHERE ProductID = pid;
    RETURN qty;
END//
DELIMITER ;

-- 4. Function: Check if product is out of stock
DELIMITER //
CREATE FUNCTION is_out_of_stock(pid INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE qty INT;
    SELECT Stock INTO qty FROM Products WHERE ProductID = pid;
    RETURN IF(qty <= 0, 'YES', 'NO');
END//
DELIMITER ;

-- 5. Function: Get total number of products
DELIMITER //
CREATE FUNCTION total_products()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM Products;
    RETURN total;
END//
DELIMITER ;

-- 6. Function: Calculate total quantity sold
DELIMITER //
CREATE FUNCTION total_quantity_sold()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT SUM(Quantity) INTO total FROM Sales;
    RETURN IFNULL(total,0);
END//
DELIMITER ;

-- 7. Function: Get product name by ID
DELIMITER //
CREATE FUNCTION get_product_name(pid INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE pname VARCHAR(50);
    SELECT ProductName INTO pname FROM Products WHERE ProductID = pid;
    RETURN pname;
END//
DELIMITER ;

-- 8. Function: Check if product exists
DELIMITER //
CREATE FUNCTION product_exists(pid INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE cnt INT;
    SELECT COUNT(*) INTO cnt FROM Products WHERE ProductID = pid;
    RETURN cnt > 0;
END//
DELIMITER ;

-- 9. Function: Calculate average price of all products
DELIMITER //
CREATE FUNCTION average_price()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_price DECIMAL(10,2);
    SELECT AVG(Price) INTO avg_price FROM Products;
    RETURN IFNULL(avg_price,0);
END//
DELIMITER ;

-- 10. Function: Get latest sale date
DELIMITER //
CREATE FUNCTION latest_sale_date()
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE last_date DATE;
    SELECT MAX(SaleDate) INTO last_date FROM Sales;
    RETURN last_date;
END//
DELIMITER ;
