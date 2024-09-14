WITH CTE AS (
    SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary,
DENSE_RANK() OVER (PARTITION BY e.departmentID ORDER BY e.salary DESC) AS ordering
FROM Employee e
JOIN Department d ON e.departmentId = d.id
)

SELECT Department, Employee, Salary
FROM CTE
WHERE ordering <= 3



