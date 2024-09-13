SELECT *
FROM 
((SELECT S.id AS id, 
CASE WHEN S1.id IS NULL THEN S.student
ELSE S1.student
END AS student
FROM Seat S
LEFT JOIN Seat S1 ON S.id+1=S1.id
WHERE S.id%2 != 0)
UNION 
SELECT S.id AS id, S1.student AS student
FROM Seat S
JOIN Seat S1 ON S.id= S1.id + 1 
WHERE S.id%2 = 0) AS combined
ORDER BY id

