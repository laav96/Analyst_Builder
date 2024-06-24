-- Hard Level: 75 points

-- Write a query to rank Points scored by all time greats in basketball. The ranking should be calculated according to the following rules:
-- The scores should be ranked from the highest to the lowest.
-- If there is a tie between two scores, both should have the same ranking.
-- After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
-- Return the result table ordered by score and name in descending order.

SELECT player, points,
  DENSE_RANK() OVER(ORDER BY points DESC) AS Ranking
  FROM player_totals
  ORDER BY points DESC, player DESC
  ;

-- DENSE_RANK (no gaps)
-- Rank highest points DESC
-- ORDER score, player DESC
