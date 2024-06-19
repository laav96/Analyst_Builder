-- Moderate Level: 25 Points 

-- There's recently been an error on our server where some emails were duplicated. We need to identify those emails so we can remove the duplicates. Write an SQL query to report all the duplicate emails and how many times they are in the database. Output should be in alphabetical order.


SELECT email, COUNT(email) AS count
FROM emails
GROUP BY email
HAVING count > 1
ORDER BY email ASC;
