# Write your MySQL query statement below
SELECT id, SUM(num) AS num
FROM ((SELECT requester_id AS id, COUNT(requester_id) AS num
FROM RequestAccepted
GROUP BY requester_id
ORDER BY requester_id DESC)
UNION ALL
(SELECT accepter_id AS id, COUNT(accepter_id) AS num
FROM RequestAccepted
GROUP BY accepter_id
ORDER BY accepter_id DESC)) AS tot
GROUP by id
ORDER BY num DESC
LIMIT 1

