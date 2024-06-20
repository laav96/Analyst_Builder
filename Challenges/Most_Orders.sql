-- Moderate Level: 25 points

-- Write an SQL query to identify the customer who had the largest number of orders. Return the Customer_ID and number of orders, but if 2 customers had the same amount of orders, return them both.

SELECT customer_id, number_of_orders
  FROM orders
WHERE number_of_orders = ALL (SELECT MAX(number_of_orders)
                                FROM orders)  ;
