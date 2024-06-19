-- Moderate Level: 25 Points

-- Find the customer who has watched the greatest number of movies. Return the Customer Name.
-- Example: If Ron watched "Lord of the Rings" 3 times and "Star Wars" 2 times (totaling 5 viewings), Leslie watched 4 movies, and Tom watched 2 movies, Ron, with his 5 total viewings, would be the answer.

SELECT name
  FROM customers c
  JOIN date_viewed dv
    ON c.customer_id = dv.customer_id
GROUP BY name
ORDER BY COUNT(movie_id) DESC
  LIMIT 1
  ;
