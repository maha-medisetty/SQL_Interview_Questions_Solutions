/*In order to improve customer segmentation efforts for users interested in purchasing furniture, 
you have been asked to find customers who have purchased the same items of furniture.
Output the product_id, brand_name, unique customer ID's who purchased that product, and the count of unique customer
ID's who purchased that product. Arrange the output in descending order with the highest count at the top. */

SELECT o.product_id,
    p.brand_name,
    STRING_AGG(DISTINCT CAST(o.customer_id AS VARCHAR), ',') AS unique_customer_ids,
    COUNT(DISTINCT o.customer_id) AS unique_customer_count
FROM
    online_orders o
INNER JOIN online_products p
    on O.product_id = p.product_id
GROUP BY o.product_id, p.brand_name;
