-- Moderate level: 25 Points

-- Identify the Football teams that scored over 400 points and had 80 or less fouls.

SELECT team FROM football 
  WHERE points_scored > 400 AND penalties <= 80
  LIMIT 10;
