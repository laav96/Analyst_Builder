-- Moderate Level: 25 points

-- Select all of the companies that had Total profits higher than 20 million over the past 3 years.
-- Assume today's date is 1/1/2023. Look back 3 years from this day.
-- Order companies alphabetically.

SELECT company
FROM companies
WHERE year >= DATE_SUB('2023-01-01', INTERVAL 3 YEAR)
GROUP BY company
HAVING SUM(profit) > 20000000
ORDER BY company ASC
  ;
