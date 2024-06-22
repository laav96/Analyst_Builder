-- Hard Level: 75 points

-- Each artist was given a rating by 3 separate judges. Write a query to combine those scores and rank the artists from highest to lowest. If there is a tie the next ranking after it should be the next number sequentially, meaning there will be a gap in the next rank. Output should include the artist, their total score, and rank. Order your output from smallest to largest rank. If there is a tie order on the artist id as well from smallest to largest.

SELECT artist_id, SUM(score) AS total_score, 
  RANK() OVER (ORDER BY SUM(score) DESC) AS Ranking
FROM rankings
GROUP BY artist_id
ORDER BY Ranking, artist_id ASC;


-- combine scores 
-- rank: next number sequentially

-- OUTPUT: artist_id, total score, rank
-- ORDER BY smallest to largest on rank + artist_id
