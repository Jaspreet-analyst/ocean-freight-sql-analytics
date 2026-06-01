-- ============================================
-- OCEAN FREIGHT SQL ANALYTICS
-- Author: Jaspreet
-- Dataset: 5,000 Ocean Freight Shipments
-- ============================================

-- ============================================
-- LEVEL 1: BASIC SELECT & FILTERING
-- ============================================

-- Q1: How many total shipments do we have?
SELECT COUNT(*) AS Total_Shipments
FROM shipments;

-- Q2: Show all unique carriers we work with
SELECT DISTINCT Carrier
FROM shipments
ORDER BY Carrier;

-- Q3: Show only shipments that were delayed
SELECT BOL_Number, Carrier, POL, POD, Delay_Days, Delay_Reason
FROM shipments
WHERE On_Time_Delivery = 'No'
ORDER BY Delay_Days DESC;

-- Q4: Show shipments with cargo value over $400,000
SELECT BOL_Number, Customer, Commodity, Cargo_Value_USD, Carrier
FROM shipments
WHERE Cargo_Value_USD > 400000
ORDER BY Cargo_Value_USD DESC;

-- Q5: Show all Maersk shipments from Shanghai
SELECT BOL_Number, Customer, POD, Container_Type, Total_Freight_USD
FROM shipments
WHERE Carrier = 'Maersk'
AND POL = 'Shanghai'
ORDER BY Total_Freight_USD DESC;

-- ============================================
-- LEVEL 2: AGGREGATIONS & GROUP BY
-- ============================================

-- Q6: Which carrier handles the most shipments?
SELECT Carrier,
       COUNT(*) AS Total_Shipments
FROM shipments
GROUP BY Carrier
ORDER BY Total_Shipments DESC;

-- Q7: What is the average freight rate per carrier?
SELECT Carrier,
       ROUND(AVG(Freight_Rate_USD), 2) AS Avg_Freight_Rate,
       ROUND(MIN(Freight_Rate_USD), 2) AS Min_Rate,
       ROUND(MAX(Freight_Rate_USD), 2) AS Max_Rate
FROM shipments
GROUP BY Carrier
ORDER BY Avg_Freight_Rate DESC;

-- Q8: Which delay reason causes the most delays?
SELECT Delay_Reason,
       COUNT(*) AS Total_Occurrences,
       ROUND(AVG(Delay_Days), 1) AS Avg_Days_Delayed
FROM shipments
WHERE Delay_Reason != 'None'
GROUP BY Delay_Reason
ORDER BY Total_Occurrences DESC;

-- Q9: What is the on-time delivery rate per carrier?
SELECT Carrier,
       COUNT(*) AS Total_Shipments,
       SUM(CASE WHEN On_Time_Delivery = 'Yes' THEN 1 ELSE 0 END) AS On_Time,
       ROUND(SUM(CASE WHEN On_Time_Delivery = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS On_Time_Pct
FROM shipments
GROUP BY Carrier
ORDER BY On_Time_Pct DESC;

-- Q10: Which port of loading ships the highest value cargo?
SELECT POL,
       COUNT(*) AS Shipments,
       ROUND(AVG(Cargo_Value_USD), 2) AS Avg_Cargo_Value,
       ROUND(SUM(Cargo_Value_USD), 2) AS Total_Cargo_Value
FROM shipments
GROUP BY POL
ORDER BY Total_Cargo_Value DESC;

-- Q11: Total freight revenue by year
SELECT YEAR(ETD) AS Year,
       COUNT(*) AS Total_Shipments,
       ROUND(SUM(Total_Freight_USD), 2) AS Total_Revenue
FROM shipments
GROUP BY YEAR(ETD)
ORDER BY Year;

-- ============================================
-- LEVEL 3: SUBQUERIES, CTEs & WINDOW FUNCTIONS
-- ============================================

-- Q12: Carriers performing worse than the overall average delay
SELECT Carrier,
       ROUND(AVG(Delay_Days), 2) AS Avg_Delay,
       (SELECT ROUND(AVG(Delay_Days), 2) FROM shipments) AS Overall_Avg
FROM shipments
GROUP BY Carrier
HAVING AVG(Delay_Days) > (SELECT AVG(Delay_Days) FROM shipments)
ORDER BY Avg_Delay DESC;

-- Q13: CTE: On-time performance summary by route
WITH Route_Performance AS (
    SELECT POL,
           POD,
           COUNT(*) AS Total_Shipments,
           SUM(CASE WHEN On_Time_Delivery = 'Yes' THEN 1 ELSE 0 END) AS On_Time,
           ROUND(AVG(Delay_Days), 1) AS Avg_Delay_Days
    FROM shipments
    GROUP BY POL, POD
)
SELECT *,
       ROUND(On_Time * 100.0 / Total_Shipments, 1) AS On_Time_Pct
FROM Route_Performance
WHERE Total_Shipments >= 10
ORDER BY On_Time_Pct ASC;

-- Q14: Window Function: Rank carriers by total freight revenue
SELECT Carrier,
       ROUND(SUM(Total_Freight_USD), 2) AS Total_Revenue,
       RANK() OVER (ORDER BY SUM(Total_Freight_USD) DESC) AS Revenue_Rank
FROM shipments
GROUP BY Carrier;

-- Q15: Window Function: Running total of freight revenue by month
SELECT YEAR(ETD) AS Year,
       MONTH(ETD) AS Month,
       ROUND(SUM(Total_Freight_USD), 2) AS Monthly_Revenue,
       ROUND(SUM(SUM(Total_Freight_USD)) OVER (ORDER BY YEAR(ETD), MONTH(ETD)), 2) AS Running_Total
FROM shipments
GROUP BY YEAR(ETD), MONTH(ETD)
ORDER BY Year, Month;

-- Q16: CTE + Window: Top customer per commodity by cargo value
WITH Customer_Commodity AS (
    SELECT Customer,
           Commodity,
           ROUND(SUM(Cargo_Value_USD), 2) AS Total_Value,
           RANK() OVER (PARTITION BY Commodity ORDER BY SUM(Cargo_Value_USD) DESC) AS Rnk
    FROM shipments
    GROUP BY Customer, Commodity
)
SELECT Commodity, Customer, Total_Value
FROM Customer_Commodity
WHERE Rnk = 1
ORDER BY Total_Value DESC;