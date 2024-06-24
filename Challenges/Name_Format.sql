-- Hard: 75 points

-- Here we have the names of several students first and last names.
-- We need all of the names to be in Proper Case. This is where the first character is capitalized and all the other letters are lower case.
-- Please include the first name and last name combined into one column in proper case. Proper case should be applied to both first and last name.

-- For example: "JOHN MATSON -> John Matson"
-- Order by the first and last name in alphabetical order.

SELECT
  CONCAT(UPPER(SUBSTRING(first_name,1,1)),
  LOWER(SUBSTRING(first_name,2)),' ',
  UPPER(SUBSTRING(last_name,1,1)),
  LOWER(SUBSTRING(last_name,2))) AS full_name
FROM names
ORDER BY full_name;
