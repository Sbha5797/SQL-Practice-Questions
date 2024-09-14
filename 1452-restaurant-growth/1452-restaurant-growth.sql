# Write your MySQL query statement below
WITH CTE AS 
(SELECT visited_on, SUM(amount) AS total_amount
FROM Customer
GROUP BY visited_on
ORDER BY visited_on)

SELECT visited_on, SUM(total_amount) OVER (ROWS BETWEEN 6 PRECEDING  AND CURRENT ROW) AS amount,
ROUND(AVG(total_amount) OVER (ROWS BETWEEN 6 PRECEDING  AND CURRENT ROW),2) AS average_amount
FROM CTE
LIMIT 100 OFFSET 6

