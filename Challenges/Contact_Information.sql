-- Moderate Level: 25 points

-- Write a query to report the first and last name of each person in the people table. Join to the contacts table and return the email for each person as well. If they don't have an email we need to create one for them. Use their first and last name to create a gmail for them. Example: Jenny Fisher's email would become jenny.fisher@gmail.com Output should include first name, last name, and email. All emails should be populated. Order the output on email address alphabetically. Note this can be done in a few ways, but we can use a function called "COALESCE" which will check for NULL Values and if it is NULL it will populate it with whatever you put in there.

SELECT p.first_name, 
  p.last_name, 
  COALESCE(c.email,
    CONCAT(LOWER(p.first_name), '.', LOWER(p.last_name), '@gmail.com')) AS email
  FROM people p
  JOIN contacts c
    ON p.id = c.id
  ORDER BY email ASC
  ;
