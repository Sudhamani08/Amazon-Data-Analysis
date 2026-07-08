-- =====================================================
-- AMAZON SALES DATA ANALYSIS
-- SQL ANALYSIS
-- =====================================================

USE amazon_analysis;

-- 1. View Dataset
SELECT * FROM amazon_sales;

-- 2. Total Number of Products
SELECT COUNT(*) AS Total_Products
FROM amazon_sales;

-- 3. Average Rating
SELECT ROUND(AVG(rating),2) AS Average_Rating
FROM amazon_sales;

-- 4. Top 10 Highest Rated Products
SELECT product_name,rating
FROM amazon_sales
ORDER BY rating DESC
LIMIT 10;

-- 5. Top 10 Most Expensive Products
SELECT product_name,actual_price
FROM amazon_sales
ORDER BY actual_price DESC
LIMIT 10;

-- 6. Top 10 Highest Discounted Products
SELECT product_name,
       discount_percentage
FROM amazon_sales
ORDER BY discount_percentage DESC
LIMIT 10;

-- 7. Category-wise Product Count
SELECT category,
       COUNT(*) AS Total_Products
FROM amazon_sales
GROUP BY category
ORDER BY Total_Products DESC;

-- 8. Average Rating by Category
SELECT category,
       ROUND(AVG(rating),2) AS Average_Rating
FROM amazon_sales
GROUP BY category
ORDER BY Average_Rating DESC;

-- 9. Average Price by Category
SELECT category,
       ROUND(AVG(actual_price),2) AS Average_Price
FROM amazon_sales
GROUP BY category
ORDER BY Average_Price DESC;

-- 10. Products with Rating >= 4.5
SELECT product_name,
       rating
FROM amazon_sales
WHERE rating >= 4.5
ORDER BY rating DESC;

-- 11. Products with Discount Greater Than 50%
SELECT product_name,
       discount_percentage
FROM amazon_sales
WHERE discount_percentage > 50
ORDER BY discount_percentage DESC;

-- 12. Top 10 Most Reviewed Products
SELECT product_name,
       rating_count
FROM amazon_sales
ORDER BY rating_count DESC
LIMIT 10;

 -- 13. Products Above Average Price
SELECT product_name, actual_price
FROM amazon_sales
WHERE actual_price > (
    SELECT AVG(actual_price)
    FROM amazon_sales
)
ORDER BY actual_price DESC;
-- 14.  Products with High Rating and High Reviews
SELECT product_name, rating, rating_count
FROM amazon_sales
WHERE rating >= 4.5
  AND rating_count >= 1000
ORDER BY rating_count DESC;