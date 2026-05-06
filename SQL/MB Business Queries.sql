-- =====================================================
-- Retail Sales Intelligence & Customer Behavior Analytics
-- =====================================================

-- 🔹 1. Create Database
-- CREATE DATABASE IF NOT EXISTS retail_Sales;
USE retail_Sales;


-- NOTE:
-- Ensure your table `customers` is already created 
-- using Python (pandas to_sql)

-- =====================================================
-- BASIC BUSINESS QUERIES
-- =====================================================

-- Q1. What is the total revenue generated?
SELECT SUM(revenue) AS total_revenue 
FROM customers;

-- Q2. What is the revenue distribution by gender?
SELECT gender, SUM(revenue) AS total_revenue
FROM customers
GROUP BY gender;

-- Q3. Which age groups contribute the most to revenue?
SELECT age_group, SUM(revenue) AS total_revenue
FROM customers
GROUP BY age_group
ORDER BY total_revenue DESC;

-- Q4. Which product categories generate the highest revenue?
SELECT category, SUM(revenue) AS total_revenue
FROM customers
GROUP BY category
ORDER BY total_revenue DESC;

-- =====================================================
-- PRODUCT ANALYSIS
-- =====================================================

-- Q5. What are the top 5 products by total sales?
SELECT item_purchased, SUM(revenue) AS total_sales
FROM customers
GROUP BY item_purchased
ORDER BY total_sales DESC
LIMIT 5;

-- Q6. Which products have the highest average ratings?
SELECT item_purchased, ROUND(AVG(review_rating),2) AS avg_rating
FROM customers
GROUP BY item_purchased
ORDER BY avg_rating DESC
LIMIT 5;

-- Q7. What are the top 3 products within each category based on sales?
SELECT category, item_purchased, total_sales
FROM (
    SELECT category, item_purchased, SUM(revenue) AS total_sales,
           RANK() OVER (PARTITION BY category ORDER BY SUM(revenue) DESC) AS rnk
    FROM customers
    GROUP BY category, item_purchased
) ranked
WHERE rnk <= 3;

-- =====================================================
-- CUSTOMER ANALYSIS
-- =====================================================

-- Q8. How are customers distributed across different segments?
SELECT customer_segment, COUNT(*) AS customer_count, SUM(revenue) AS total_revenue
FROM customers
GROUP BY customer_segment;

-- Q9. How many repeat buyers (more than 5 purchases) exist?
SELECT COUNT(*) AS repeat_buyers
FROM customers
WHERE previous_purchases > 5;

-- Q10. What is the total revenue contributed by loyal customers?
SELECT SUM(revenue) AS loyal_revenue
FROM customers
WHERE customer_segment = 'Loyal';

-- =====================================================
-- BEHAVIOR ANALYSIS
-- =====================================================

-- Q11. How does discount application impact revenue and order volume?
SELECT discount_applied, 
       COUNT(*) AS total_orders,
       ROUND(AVG(revenue),2) AS avg_revenue,
       ROUND(SUM(revenue),2) AS total_revenue
FROM customers
GROUP BY discount_applied;

-- Q12. Which customers used discounts but still spent above average?
SELECT *
FROM customers
WHERE discount_applied = 'Yes'
AND revenue > (SELECT AVG(revenue) FROM customers);

-- Q13. Do subscribed customers spend more than non-subscribers?
SELECT subscription_status,
       COUNT(*) AS customers,
       ROUND(AVG(revenue),2) AS avg_spend,
       SUM(revenue) AS total_revenue
FROM customers
GROUP BY subscription_status;

-- =====================================================
-- SALES & TREND ANALYSIS
-- =====================================================

-- Q14. Which season generates the highest revenue?
SELECT season, SUM(revenue) AS total_revenue
FROM customers
GROUP BY season
ORDER BY total_revenue DESC;

-- Q15. How does shipping type affect order volume and average order value?
SELECT shipping_type,
       COUNT(*) AS total_orders,
       ROUND(AVG(revenue),2) AS avg_order_value
FROM customers
GROUP BY shipping_type;

-- Q16. Which locations contribute the most to sales?
SELECT location, SUM(revenue) AS total_revenue
FROM customers
GROUP BY location
ORDER BY total_revenue DESC;

-- =====================================================
-- ADVANCED INSIGHTS
-- =====================================================

-- Q17. Which categories have the highest average product ratings?
SELECT category, ROUND(AVG(review_rating),2) AS avg_rating
FROM customers
GROUP BY category
ORDER BY avg_rating DESC;

-- Q18. Which products rely most on discounts (highest discount percentage)?
SELECT item_purchased,
       ROUND(SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS discount_percentage
FROM customers
GROUP BY item_purchased
ORDER BY discount_percentage DESC
LIMIT 5;

-- Q19. Which age group has the highest average spending?
SELECT age_group, ROUND(AVG(revenue),2) AS avg_spending
FROM customers
GROUP BY age_group
ORDER BY avg_spending DESC;
