# Write your MySQL query statement below
WITH xyz AS
(SELECT 
ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num, 
CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled' END AS status, customer_id
FROM Delivery)

SELECT 
ROUND((SUM(CASE WHEN status = 'immediate' THEN 1 ELSE 0 END)/COUNT(customer_id))*100 ,2)
AS immediate_percentage
FROM xyz
WHERE row_num = 1


