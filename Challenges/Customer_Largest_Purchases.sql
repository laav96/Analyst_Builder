-- Moderate Level: 25 points

-- We want to take a look at each customers purchases and give them their own row number. Break the rows out by the customer and give each row a number based off the amount spent starting from the highest to the lowest.

SELECT customer_id,
  amount,
  ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY amount DESC) AS row_num
FROM purchases;



-- each purchase row_num
-- sort amnt spent by DESC
