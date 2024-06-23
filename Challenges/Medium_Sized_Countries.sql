-- Easy Level: 10 points

-- Identify all of the countries that have populations between 50 million and 100 million.
-- Provide the country and population in the output from smallest to largest population.

SELECT country, population
  FROM country
  WHERE population BETWEEN 50000000 AND 100000000
  ORDER BY population ASC;


-- country with population between 50m and 100m
-- OUTPUT: country and population ORDER BY population ASC
