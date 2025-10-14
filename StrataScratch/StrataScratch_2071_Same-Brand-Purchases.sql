/*The marketing department is aiming its next promotion at customers who have purchased products from two particular brands: Fort West and Golden.

You have been asked to prepare a list of customers who purchased products from both brands. */

WITH customer_brand_tab AS
(SELECT B.customer_id,
        COUNT(Distinct A.brand_name) as brand_count
FROM
    online_products A
INNER JOIN
    online_orders B
ON A.product_id = B.product_id
WHERE A.brand_name IN ('Fort West', 'Golden')
GROUP BY B.customer_id)

SELECT 
    customer_id
FROM
    customer_brand_tab
WHERE brand_count = 2;
