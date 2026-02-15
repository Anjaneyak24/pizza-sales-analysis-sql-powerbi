select * from pizza_sales

--1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
 
--2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales
 
--3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales
 
--4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
 
--5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales
 

 
----------------- Month Extraction FUNCTIONS--------
--1. For Month as Integer (1–12):
-- Use the MONTH function:

SELECT 
    order_date,
    MONTH(order_date) AS month
FROM pizza_sales;

SELECT 
    order_date,
    DATEPART(month, order_date) AS month
FROM pizza_sales;

-- 2. For Month Name (e.g., "January", "February"):
--Use FORMAT:

SELECT 
    order_date,
    FORMAT(order_date, 'MMMM') AS month_name
FROM pizza_sales;

--3. For Month Abbreviation (e.g., "Jan", "Feb"):
-- Use FORMAT:
SELECT 
    order_date,
    FORMAT(order_date, 'MMM') AS month_abbr
FROM pizza_sales;

---------------- Year Extraction-------------------

/*Purpose	Function	Example Output	Best For
Year as integer	YEAR(date_column)	2025	Calculations, grouping
Year as integer	DATEPART(year, date_column)	2025	Same as above
Year as string	FORMAT(date_column, 'yyyy')	"2025"	Display only*/

-- Using the YEAR() Function ----
SELECT 
    order_date,
    YEAR(order_date) AS year
FROM pizza_sales;



-- Using DATEPART() ---
SELECT 
    order_date,
    DATEPART(year, order_date) AS year
FROM pizza_sales;

-- 1) Using FORMAT() (As a String) ---
SELECT 
    order_date,
    FORMAT(order_date, 'yyyy') AS year_str
FROM pizza_sales;


-- Add a new column for the month abbreviation
ALTER TABLE pizza_sales ADD month VARCHAR(3);

-- Populate it with the 3-letter month abbreviation
UPDATE pizza_sales SET month = FORMAT(order_date, 'MMM');



