-- RETAIL SALES ANALYSIS PROJECT

CREATE DATABASE retail_sales_db;

USE retail_sales_db;

-- 1.DATA VALIDATION

-- DATA UNDERSTANDING

DESCRIBE retail_sales;

SELECT COUNT(*) AS Total_Records
FROM retail_sales;

-- DATA CLEANING

SELECT *
FROM retail_sales
WHERE Transaction_ID IS NULL
   OR sale_date IS NULL
   OR Customer_ID IS NULL;
   
-- 2.KPI ANALYSIS
   
-- Total Revenue

SELECT SUM(Total_amount) AS Total_Sales
FROM retail_sales;

-- Average Order Value

SELECT AVG(Total_amount) AS Average_Sales
FROM retail_sales;

-- Total Quantity

SELECT SUM(Quantity) AS Total_Quantity
FROM retail_sales;

-- 3.BUSSINESS ANALYSIS

-- Category-wise Sales

SELECT
    Product_Category,
    SUM(Total_amount) AS Total_Sales
FROM retail_sales
GROUP BY Product_Category
ORDER BY Total_Sales DESC;

-- Gender-wise Sales

SELECT
    Gender,
    SUM(Total_amount) AS Total_Sales
FROM retail_sales
GROUP BY Gender;

-- Monthly Sales

SELECT
    MONTH(sale_date) AS month_no,
    MONTHNAME(sale_date) AS month_name,
    SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY MONTH(sale_date), MONTHNAME(sale_date)
ORDER BY month_no;

-- Age Group Analysis 

SELECT
    CASE
        WHEN Age < 20 THEN 'Below 20'
        WHEN Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(Total_Amount) AS total_sales
FROM retail_sales
GROUP BY age_group
ORDER BY total_sales DESC;

-- Top 10 Transactions

SELECT
    Transaction_ID,
    Product_Category,
    Total_Amount
FROM retail_sales
ORDER BY Total_Amount DESC
LIMIT 10;

