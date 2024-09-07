# Write your MySQL query statement below
SELECT DISTINCT(num) AS ConsecutiveNums
FROM
(SELECT num, LAG(num,1,0) OVER (ORDER BY id) AS previous_row, LEAD(num,1) OVER (ORDER BY id) AS next_row
FROM Logs) AS non
WHERE num = previous_row AND previous_row = next_row AND num = next_row

