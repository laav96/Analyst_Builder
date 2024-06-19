-- Moderate Level: 25 Points

-- What was the average time spent, per user, gaming on their computer?

SELECT user_id, AVG(minutes_per_session) AS Average_Time_Spent
  FROM sessions
  WHERE activity = 'Gaming'
  GROUP BY user_id
  ;
