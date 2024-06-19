-- Moderate Level: 25 points

-- Write a query to return all of the phone numbers that have an area code of 701 (this means the phone numbers begins with 701).

SELECT *
  FROM phone_numbers 
  WHERE numbers LIKE '701%' LIMIT 10;
