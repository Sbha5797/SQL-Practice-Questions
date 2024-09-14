WITH CTE AS
(SELECT *
FROM Activities 
GROUP BY sell_date, product
ORDER BY sell_date, product ASC) 

SELECT sell_date, COUNT(product) AS num_sold, GROUP_CONCAT(DISTINCT product SEPARATOR ',') AS products
FROM CTE
GROUP BY sell_date
ORDER BY sell_date, product ASC
