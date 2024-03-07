-- Write a model using Snowflake for Two Trees Olive Oil. 
-- Here we want to build a new view (or model) that allows us to aggregate how much of each product was sold. 
-- We'll call it the Product Performance model, or product_perf in the view.

CREATE VIEW product_perf AS(
  SELECT product_id, ANY_VALUE(productname) AS productname, ANY_VALUE(productcategory) AS productcategory, ANY_VALUE(price) AS price, SUM(orders.quantity) AS total_product_sold, COUNT(order_id) AS total_product_orders
    FROM products
    JOIN orders ON products.product_id = orders.productid
    GROUP BY product_id);

SELECT * FROM product_perf;