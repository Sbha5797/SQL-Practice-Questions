# Write your MySQL query statement below
SELECT p.product_name, SUM(unit) AS unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE EXTRACT(MONTH FROM order_date) = 02 AND EXTRACT(YEAR FROM order_date) = 2020
GROUP BY p.product_id
HAVING unit >= 100