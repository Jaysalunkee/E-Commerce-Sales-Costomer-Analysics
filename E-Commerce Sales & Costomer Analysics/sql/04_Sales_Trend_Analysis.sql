-- =============================================
-- 04 SALES TREND ANALYSIS
-- =============================================

-- 1. Yearly performance
SELECT
    Year,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY Year
ORDER BY Year;


-- 2. Monthly sales trend
SELECT
    Year,
    MONTH(Order_Date) AS Month_Number,
    DATENAME(MONTH, Order_Date) AS Month_Name,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY
    Year,
    MONTH(Order_Date),
    DATENAME(MONTH, Order_Date)
ORDER BY Year, Month_Number;


-- 3. Monthly order trend
SELECT
    Year,
    MONTH(Order_Date) AS Month_Number,
    DATENAME(MONTH, Order_Date) AS Month_Name,
    COUNT(DISTINCT Order_ID) AS Orders
FROM Clean_Ecommerce
GROUP BY
    Year,
    MONTH(Order_Date),
    DATENAME(MONTH, Order_Date)
ORDER BY Year, Month_Number;


-- 4. Weekday performance
SELECT
    Weekday,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY Weekday
ORDER BY Sales DESC;


-- 5. Best sales month
SELECT TOP 1
    Year,
    MONTH(Order_Date) AS Month_Number,
    DATENAME(MONTH, Order_Date) AS Month_Name,
    SUM(Net_Amount) AS Sales
FROM Clean_Ecommerce
GROUP BY
    Year,
    MONTH(Order_Date),
    DATENAME(MONTH, Order_Date)
ORDER BY Sales DESC;


-- 6. Best profit month
SELECT TOP 1
    Year,
    MONTH(Order_Date) AS Month_Number,
    DATENAME(MONTH, Order_Date) AS Month_Name,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY
    Year,
    MONTH(Order_Date),
    DATENAME(MONTH, Order_Date)
ORDER BY Profit DESC;


-- 7. Sales by year and category
SELECT
    Year,
    Category,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY Year, Category
ORDER BY Year, Sales DESC;