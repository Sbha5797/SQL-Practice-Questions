# Write your MySQL query statement below
SELECT name AS results
FROM
(SELECT COUNT(m.movie_id) AS no_of_reviews, u.user_id, mr. rating, mr.created_at, u.name
FROM Movies m 
LEFT JOIN MovieRating mr ON m.movie_id = mr.movie_id
RIGHT JOIN Users u ON u.user_id = mr.user_id
GROUP BY u.name
ORDER BY no_of_reviews DESC, u.name ASC
LIMIT 1) AS t1
UNION ALL
SELECT title AS results
FROM
(SELECT AVG(mr.rating) AS avg_rating , title
FROM Movies m 
LEFT JOIN MovieRating mr ON m.movie_id = mr.movie_id
RIGHT JOIN Users u ON u.user_id = mr.user_id
WHERE EXTRACT(YEAR FROM mr.created_at) = 2020 AND EXTRACT(MONTH FROM mr.created_at) = 02
GROUP BY m.movie_id
ORDER BY avg_rating DESC, title ASC
LIMIT 1 )AS Total_results
