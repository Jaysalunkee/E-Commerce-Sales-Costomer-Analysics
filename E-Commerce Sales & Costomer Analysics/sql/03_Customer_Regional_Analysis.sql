-- =============================================
-- 03 CUSTOMER & REGIONAL ANALYSIS
-- =============================================

-- 1. Top customers
SELECT TOP 10
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Net_Amount) AS Total_Spending,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY Customer_Name
ORDER BY Total_Spending DESC;


-- 2. Customer order frequency
SELECT
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Net_Amount) AS Sales
FROM Clean_Ecommerce
GROUP BY Customer_Name
ORDER BY Orders DESC;


-- 3. State performance
SELECT
    State,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY State
ORDER BY Sales DESC;


-- 4. Top states by profit
SELECT TOP 10
    State,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY State
ORDER BY Profit DESC;


-- 5. City performance
SELECT
    City,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY City
ORDER BY Sales DESC;


-- 6. State profit margin
SELECT
    State,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit,
    ROUND(
        SUM(Profit) * 100.0 /
        NULLIF(SUM(Net_Amount), 0), 2
    ) AS Profit_Margin_Percent
FROM Clean_Ecommerce
GROUP BY State
ORDER BY Profit_Margin_Percent DESC;


-- 7. Payment mode by region
SELECT
    State,
    Payment_Mode,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Net_Amount) AS Sales
FROM Clean_Ecommerce
GROUP BY State, Payment_Mode
ORDER BY State, Sales DESC;