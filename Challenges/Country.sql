-- Easy Level: 10 Points

-- Select all columns where the country is Canada, France, or Italy. Order by Country in alphabetical order.

SELECT * FROM country 
  WHERE country IN ('Canada', 'France', 'Italy')
  ORDER BY country LIMIT 10;
