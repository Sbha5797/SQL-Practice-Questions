# Write your MySQL query statement below
SELECT class
FROM
(SELECT COUNT(student) AS No_students, class
FROM Courses
GROUP BY class) AS temp
WHERE No_students>=5