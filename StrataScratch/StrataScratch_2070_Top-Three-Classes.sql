/*The marketing department wants to identify the top-performing product classes based on the number of orders placed for each class.

If multiple product classes have the same number of sales and qualify for the top 3, include all of them in the output. */

WITH ranked_table AS
(SELECT 
    A.product_class,
    COUNT(B.product_id) as total_orders,
    DENSE_RANK() OVER (ORDER BY COUNT(B.product_id) DESC) as rank_
FROM
    online_products A
INNER JOIN
    online_orders B
ON A.product_id = B.product_id
GROUP BY A.product_class)

SELECT 
    product_class
FROM
    ranked_table
WHERE rank_ <= 3;
