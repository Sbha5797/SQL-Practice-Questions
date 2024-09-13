# Write your MySQL query statement below
SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees e1 ON e.manager_id = e1.employee_id
WHERE e.salary < 30000 AND (e1.employee_id IS NULL AND e.manager_id IS NOT NULL)
ORDER BY e.employee_id