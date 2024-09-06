WITH FirstLogin AS
(SELECT A1.player_id,
MIN(A1.event_date) AS First_login_date
FROM Activity A1 
GROUP BY A1.player_id),

SecondLogin AS
(SELECT DISTINCT F.player_id AS two_day, A1. event_date AS Second_login_date
FROM Activity A1
JOIN FirstLogin F
ON F.player_id = A1.player_id AND 
A1.event_date = DATE_ADD(First_login_date, INTERVAL 1 day))

SELECT ROUND((COUNT(DISTINCT two_day) / (SELECT COUNT(DISTINCT player_id) FROM Activity)), 2) AS fraction
FROM SecondLogin;