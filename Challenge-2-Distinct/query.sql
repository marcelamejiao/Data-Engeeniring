-- The business team wants to know if they can add the number of states they're sending each product.

CREATE VIEW product_perf AS(
  SELECT 
  product_id
  , ANY_VALUE(productname) AS productname
  , ANY_VALUE(productcategory) AS productcategory
  , ANY_VALUE(price) AS price
  , SUM(orders.quantity) AS total_product_sold
  , COUNT(order_id) AS total_product_orders
  , COUNT(distinct customers.state) AS total_states
    FROM products
    JOIN orders ON products.product_id = orders.productid
    JOIN customers ON orders.customer_id = customers.customer_id
    GROUP BY product_id);

SELECT * FROM product_perf;