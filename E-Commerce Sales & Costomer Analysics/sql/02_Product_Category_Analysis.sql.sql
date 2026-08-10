-- =============================================
-- 02 PRODUCT & CATEGORY ANALYSIS
-- =============================================

-- 1. Category performance
SELECT
    Category,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Qty) AS Quantity_Sold,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY Category
ORDER BY Sales DESC;


-- 2. Product performance
SELECT
    Product,
    SUM(Qty) AS Quantity_Sold,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY Product
ORDER BY Sales DESC;


-- 3. Top 5 products
SELECT TOP 5
    Product,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY Product
ORDER BY Sales DESC;


-- 4. Most profitable products
SELECT TOP 10
    Product,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit,
    ROUND(
        SUM(Profit) * 100.0 /
        NULLIF(SUM(Net_Amount), 0), 2
    ) AS Profit_Margin_Percent
FROM Clean_Ecommerce
GROUP BY Product
ORDER BY Profit DESC;


-- 5. Category contribution
SELECT
    Category,
    SUM(Net_Amount) AS Sales,
    ROUND(
        SUM(Net_Amount) * 100.0 /
        SUM(SUM(Net_Amount)) OVER (), 2
    ) AS Sales_Contribution_Percent
FROM Clean_Ecommerce
GROUP BY Category
ORDER BY Sales DESC;


-- 6. Discount analysis
SELECT
    Discount,
    COUNT(DISTINCT Order_ID) AS Orders,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit
FROM Clean_Ecommerce
GROUP BY Discount
ORDER BY Discount;


-- 7. Product profitability
SELECT
    Product,
    SUM(Net_Amount) AS Sales,
    SUM(Profit) AS Profit,
    ROUND(
        SUM(Profit) * 100.0 /
        NULLIF(SUM(Net_Amount), 0), 2
    ) AS Profit_Margin_Percent
FROM Clean_Ecommerce
GROUP BY Product
ORDER BY Profit_Margin_Percent DESC;