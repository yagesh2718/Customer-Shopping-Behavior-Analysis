-- ========================================================
-- CUSTOMER SHOPPING BEHAVIOR ANALYSIS
-- 10 KEY BUSINESS QUESTIONS ANSWERED IN PURE PostgreSQL
-- Table: customer_shopping_behavior
-- ========================================================

-- Question 1: Revenue contribution by Category + AOV
-- Which category makes the most money and has the highest average order value?
SELECT 
    "Category",
    COUNT(*) AS transactions,
    ROUND(SUM("Purchase Amount (USD)")::numeric, 2) AS total_revenue,
    ROUND(AVG("Purchase Amount (USD)")::numeric, 2) AS avg_order_value
FROM customer_shopping_behavior
GROUP BY "Category"
ORDER BY total_revenue DESC;


-- Question 2: Subscriber vs Non-Subscriber Performance
-- How much more do subscribers spend and contribute?
SELECT 
    "Subscription Status",
    COUNT(*) AS customers,
    ROUND(AVG("Purchase Amount (USD)"), 2) AS avg_order_value,
    ROUND(SUM("Purchase Amount (USD)"), 2) AS total_revenue,
    ROUND(100.0 * SUM("Purchase Amount (USD)") / SUM(SUM("Purchase Amount (USD)")) OVER (), 2) || '%' AS revenue_share
FROM customer_shopping_behavior
GROUP BY "Subscription Status"
ORDER BY total_revenue DESC;


-- Question 3: Top 10 States by Revenue & Subscriber Concentration

SELECT 
    "Location",
    ROUND(SUM("Purchase Amount (USD)")::numeric, 2) AS total_revenue,
    ROUND(AVG("Purchase Amount (USD)")::numeric, 2) AS avg_purchase,
    COUNT(*) AS transactions,
    SUM(CASE WHEN "Subscription Status" = 'Yes' THEN 1 ELSE 0 END) AS subscribers,
    ROUND(100.0 * SUM(CASE WHEN "Subscription Status" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) || '%' AS subscriber_rate
FROM customer_shopping_behavior
GROUP BY "Location"
ORDER BY total_revenue DESC
LIMIT 10;


-- Question 4: Impact of Discounts & Promo Codes

SELECT 
    "Discount Applied",
    COUNT(*) AS transactions,
    ROUND(AVG("Purchase Amount (USD)")::numeric, 2) AS avg_order_value,
    ROUND(AVG("Previous Purchases")::numeric, 2) AS avg_previous_purchases,
    ROUND(AVG("Review Rating")::numeric, 2) AS avg_rating
FROM customer_shopping_behavior
GROUP BY "Discount Applied"
ORDER BY avg_order_value DESC;


-- Question 5: Best-Selling Combination (Season + Category + Color + Size)
SELECT 
    "Season",
    "Category",
    "Color",
    "Size",
    COUNT(*) AS units_sold,
    ROUND(SUM("Purchase Amount (USD)")::numeric, 2) AS total_revenue
FROM customer_shopping_behavior
GROUP BY "Season", "Category", "Color", "Size"
ORDER BY total_revenue DESC
LIMIT 15;


-- Question 6: Age Group Spending Behavior
SELECT 
    CASE 
        WHEN "Age" BETWEEN 18 AND 24 THEN '18-24'
        WHEN "Age" BETWEEN 25 AND 34 THEN '25-34'
        WHEN "Age" BETWEEN 35 AND 49 THEN '35-49'
        WHEN "Age" BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+' 
    END AS age_group,
    COUNT(*) AS customers,
    ROUND(AVG("Purchase Amount (USD)")::numeric, 2) AS avg_order_value,
    ROUND(SUM("Purchase Amount (USD)")::numeric, 2) AS total_revenue
FROM customer_shopping_behavior
GROUP BY age_group
ORDER BY total_revenue DESC;


-- Q7: Repeat vs One-Time Buyers + Frequency Impact


SELECT 
    CASE 
        WHEN "Previous Purchases" > 0 THEN 'Repeat Customer'
        ELSE 'First-Time Buyer'
    END AS customer_type,
    
    COUNT(*) AS customer_count,
    
    ROUND(SUM("Purchase Amount (USD)")::numeric, 2) AS total_revenue,
    
    ROUND(AVG("Purchase Amount (USD)")::numeric, 2) AS avg_order_value,
    
    ROUND(100.0 * SUM("Purchase Amount (USD)") / 
          (SELECT SUM("Purchase Amount (USD)") FROM customer_shopping_behavior), 2) || '%' AS revenue_share
FROM customer_shopping_behavior
GROUP BY 
    CASE 
        WHEN "Previous Purchases" > 0 THEN 'Repeat Customer'
        ELSE 'First-Time Buyer'
    END
ORDER BY total_revenue DESC;


-- Frequency of Purchases impact
SELECT 
    "Frequency of Purchases",
    COUNT(*) AS transactions,
    ROUND(AVG("Purchase Amount (USD)")::numeric, 2) AS aov
FROM customer_shopping_behavior
GROUP BY "Frequency of Purchases"
ORDER BY aov DESC;


-- Question 8: Shipping Type Preference & Link to Review Rating
SELECT 
    "Shipping Type",
    COUNT(*) AS orders,
    ROUND(AVG("Purchase Amount (USD)")::numeric, 2) AS avg_order_value,
    ROUND(AVG("Review Rating")::numeric, 2) AS avg_rating
FROM customer_shopping_behavior
GROUP BY "Shipping Type"
ORDER BY avg_order_value DESC;


-- Question 9: 2-Day Shipping leads with the highest average order value of $60.73 (627 orders, rating 3.77), followed by Express ($60.48). Free Shipping is the most frequently chosen method (675 orders, AOV $60.41). Standard Shipping has the lowest AOV at $58.46. Customers opting for faster delivery spend noticeably more per order while maintaining high satisfaction levels.
SELECT 
    "Payment Method",
    COUNT(*) AS transactions,
    ROUND(AVG("Purchase Amount (USD)")::numeric, 2) AS avg_order_value,
    ROUND(SUM("Purchase Amount (USD)")::numeric, 2) AS total_revenue
FROM customer_shopping_behavior
GROUP BY "Payment Method"
ORDER BY avg_order_value DESC;

-- Question 10: Customer Segments Revenue Share (using our Python segments)
SELECT 
    "Segment Name" AS customer_segment,
    COUNT(*) AS customer_count,
    ROUND(AVG("Purchase Amount (USD)"), 2) AS avg_order_value,
	ROUND(AVG("Previous Purchases"), 2) AS avg_previous_purchases,
    ROUND(SUM("Purchase Amount (USD)"), 2) AS total_revenue,
    ROUND(100.0 * SUM("Purchase Amount (USD)") / SUM(SUM("Purchase Amount (USD)")) OVER (), 2) || '%' AS revenue_share
FROM customer_shopping_behavior
GROUP BY "Segment Name"
ORDER BY total_revenue DESC;

-- ========================================================
-- END OF SCRIPT - All 10 Business Questions Answered!
-- Save this as: 10_business_questions.sql
-- ========================================================