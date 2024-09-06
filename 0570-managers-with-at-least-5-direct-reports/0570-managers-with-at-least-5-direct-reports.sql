# Write your MySQL query statement below
SELECT e.name
FROM Employee e
JOIN Employee e2
ON e.id = e2.managerId
GROUP BY e.id
HAVING COUNT(e2.id)>=5