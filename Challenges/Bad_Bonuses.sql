-- Moderate Level: 25 points

-- Everyone at Analyst Builder is supposed to receive a bonus at the end of the year. Unfortunately some people didn't receive their bonus as was promised. Write a query to determine the employees who did not receive their bonus so we can notify accounting. Return their id and name in the output. Order the id from lowest to highest.

SELECT employee_id, name 
FROM employee 
WHERE employee_id NOT IN
 (SELECT emp_id
    FROM bonus)
ORDER BY employee_id ASC;
