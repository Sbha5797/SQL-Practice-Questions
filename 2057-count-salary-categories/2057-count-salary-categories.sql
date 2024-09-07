WITH salary_categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
categories AS (
    SELECT 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
            ELSE 'Unknown'  -- Changed to 'Unknown' instead of 0 for consistency
        END AS category, 
        account_id
    FROM Accounts
)

SELECT c.category, COUNT(a.account_id) AS accounts_count
FROM salary_categories c
LEFT JOIN categories a ON c.category = a.category
GROUP BY c.category;


