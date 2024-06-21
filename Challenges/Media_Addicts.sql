-- Moderate Level: 25 points


-- Social Media Addiction can be a crippling disease affecting millions every year. We need to identify people who may fall into that category. Write a query to find the people who spent a higher than average amount of time on social media. Provide just their first names alphabetically so we can reach out to them individually.

SELECT first_name 
  FROM users u
  JOIN user_time ut
    ON u.user_id = ut.user_id
  WHERE media_time_minutes > (SELECT AVG(media_time_minutes) AS avg_media_time
                        FROM user_time)
  ORDER BY first_name ASC;


-- match user_id
-- find avg amnt of time
-- query for users who spent > avg_amnt
-- return first_name from users ASC
