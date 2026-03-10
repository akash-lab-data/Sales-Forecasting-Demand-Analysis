/*
=========================================================
Project: Sales Forecasting & Demand Analysis
Dataset: Walmart Weekly Sales
Purpose: Business analysis of historical sales data
Tools: MySQL
=========================================================
*/

create database sales_forecasting_project;
use sales_forecasting_project;
CREATE TABLE walmart_sales (
    Store INT,
    Dept INT,
    Date DATE,
    Weekly_Sales DECIMAL(15,2),
    IsHoliday BOOLEAN,
    Temperature DECIMAL(10,2),
    Fuel_Price DECIMAL(10,3),
    MarkDown1 DECIMAL(15,2),
    MarkDown2 DECIMAL(15,2),
    MarkDown3 DECIMAL(15,2),
    MarkDown4 DECIMAL(15,2),
    MarkDown5 DECIMAL(15,2),
    CPI DECIMAL(10,3),
    Unemployment DECIMAL(10,3),
    Type VARCHAR(5),
    Size INT,
    Year INT,
    Month INT,
    Week INT
);

/*
=========================================================
1. Total Business Sales
Purpose:
Understand the overall revenue generated in the dataset.
=========================================================
*/

SELECT 
    ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart_sales;



/*
=========================================================
2. Top Performing Stores
Purpose:
Identify stores contributing the highest revenue.
=========================================================
*/

SELECT 
    Store,
    ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart_sales
GROUP BY Store
ORDER BY Total_Sales DESC
LIMIT 10;



/*
=========================================================
3. Top Performing Departments
Purpose:
Identify departments driving the highest sales.
=========================================================
*/

SELECT 
    Dept,
    ROUND(SUM(Weekly_Sales),2) AS Total_Sales
FROM walmart_sales
GROUP BY Dept
ORDER BY Total_Sales DESC
LIMIT 10;



/*
=========================================================
4. Holiday vs Non-Holiday Sales
Purpose:
Determine whether holidays significantly affect sales.
=========================================================
*/

SELECT 
    IsHoliday,
    ROUND(SUM(Weekly_Sales),2) AS Total_Sales,
    ROUND(AVG(Weekly_Sales),2) AS Avg_Weekly_Sales
FROM walmart_sales
GROUP BY IsHoliday;



/*
=========================================================
5. Sales Performance by Store Type
Purpose:
Compare performance of different store types.
=========================================================
*/

SELECT 
    Type,
    ROUND(SUM(Weekly_Sales),2) AS Total_Sales,
    ROUND(AVG(Weekly_Sales),2) AS Avg_Weekly_Sales
FROM walmart_sales
GROUP BY Type
ORDER BY Total_Sales DESC;



/*
=========================================================
6. Monthly Sales Trend
Purpose:
Track how sales change month-to-month.
=========================================================
*/

SELECT 
    Year,
    Month,
    ROUND(SUM(Weekly_Sales),2) AS Monthly_Sales
FROM walmart_sales
GROUP BY Year, Month
ORDER BY Year, Month;



/*
=========================================================
7. Yearly Sales Trend
Purpose:
Identify long-term business growth or decline.
=========================================================
*/

SELECT 
    Year,
    ROUND(SUM(Weekly_Sales),2) AS Yearly_Sales
FROM walmart_sales
GROUP BY Year
ORDER BY Year;



/*
=========================================================
8. Average Sales by Store Type
Purpose:
Understand which store type performs best on average.
=========================================================
*/

SELECT 
    Type,
    ROUND(AVG(Weekly_Sales),2) AS Avg_Sales
FROM walmart_sales
GROUP BY Type
ORDER BY Avg_Sales DESC;



/*
=========================================================
9. Top Departments Within Each Store Type
Purpose:
Identify best departments per store category
using window functions.
=========================================================
*/

SELECT *
FROM (
    SELECT 
        Type,
        Dept,
        ROUND(SUM(Weekly_Sales),2) AS Total_Sales,
        RANK() OVER (
            PARTITION BY Type 
            ORDER BY SUM(Weekly_Sales) DESC
        ) AS Rank_In_Type
    FROM walmart_sales
    GROUP BY Type, Dept
) ranked_departments
WHERE Rank_In_Type <= 3;



/*
=========================================================
10. Holiday Sales by Store
Purpose:
Determine which stores benefit the most from holidays.
=========================================================
*/

SELECT 
    Store,
    ROUND(SUM(Weekly_Sales),2) AS Holiday_Sales
FROM walmart_sales
WHERE IsHoliday = 1
GROUP BY Store
ORDER BY Holiday_Sales DESC
LIMIT 10;



/*
=========================================================
End of SQL Analysis
=========================================================
*/
