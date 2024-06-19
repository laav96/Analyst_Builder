-- Easy: 10 Points

-- Mr. Hillsborough gives out letters of recommendation for any student who can obtain a "B" or higher in his class. Write a query to retrieve the first and last name of the students who scored a "B" or better on their final exam. Order your output by the first and last name in ascending order. This is just how Mr. Hillsborough prefers it.

SELECT first_name, last_name
  FROM students 
  WHERE grade = 'A' OR grade = 'B'
  ORDER BY first_name ASC
  LIMIT 10;
