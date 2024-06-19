-- Moderate - 25 points

-- Determine the profit margin for each product. The profit margin is derived by subtracting the Purchase Price from the Sale Price and then applying a 7% tax on that amount. Present the product name along with its corresponding profit (round to 2 decimal places). Order products by largest profit to smallest and products alphabetically.

SELECT product_name, 
  ROUND((sales_price - purchase_price) * 0.93, 2) AS profit
  FROM products 
  ORDER BY profit DESC, product_name ASC;
