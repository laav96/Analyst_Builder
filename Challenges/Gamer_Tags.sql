-- Create a gamer tag for each player in the tournament. Select the first 3 characters of their first name and combine that with the year they were born. Your output should have their first name, last name, and gamer tag called "gamer_tag". Order output on gamertag in alphabetical order.

-- 25 points. Moderate Level 

SELECT first_name, last_name, CONCAT(SUBSTRING(first_name,1,3),YEAR(birth_date)) AS gamer_tag
  FROM gamer_tags
  ORDER BY gamer_tag ASC;
