-- =============================================
-- 01 BUSINESS KPIs
-- =============================================

-- 1. Total business performance
SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Qty) AS Total_Quantity,
    SUM(Sales) AS Total_Sales,
    SUM(Net_Amount) AS Total_Net_Amount,
    SUM(Profit) AS Total_Profit
FROM Clean_Ecommerce;


-- 2. Profit margin
SELECT
    SUM(Net_Amount) AS Net_Sales,
    SUM(Profit) AS Profit,
    ROUND(
        SUM(Profit) * 100.0 / NULLIF(SUM(Net_Amount), 0), 2
    ) AS Profit_Margin_Percent
FROM Clean_Ecommerce;


-- 3. Average Order Value
SELECT
    ROUND(
        SUM(Net_Amount) * 1.0 /
        NULLIF(COUNT(DISTINCT Order_ID), 0), 2
    ) AS Average_Order_Value
FROM Clean_Ecommerce;


-- 4. Order status
SELECT
    Order_Status,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY Order_Status
ORDER BY Orders DESC;


-- 5. Return rate
SELECT
    COUNT(DISTINCT CASE
        WHEN Order_Status = 'Returned' THEN Order_ID
    END) AS Returned_Orders,

    COUNT(DISTINCT Order_ID) AS Total_Orders,

    ROUND(
        COUNT(DISTINCT CASE
            WHEN Order_Status = 'Returned' THEN Order_ID
        END) * 100.0
        / NULLIF(COUNT(DISTINCT Order_ID), 0), 2
    ) AS Return_Rate_Percent
FROM Clean_Ecommerce;


-- 6. Cancelled orders
SELECT
    COUNT(DISTINCT Order_ID) AS Cancelled_Orders,
    SUM(Net_Amount) AS Cancelled_Sales
FROM Clean_Ecommerce
WHERE Order_Status = 'Cancelled';


-- 7. Payment performance
SELECT
    Payment_Mode,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Net_Amount) AS Sales
FROM Clean_Ecommerce
GROUP BY Payment_Mode
ORDER BY Sales DESC;