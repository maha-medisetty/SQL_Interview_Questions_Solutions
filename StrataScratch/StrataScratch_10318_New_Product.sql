/* Calculate the net change in the number of products launched by companies in 2020 compared to 2019. Your output should include the company names and the net difference.
(Net difference = Number of products launched in 2020 - The number launched in 2019.)  */

WITH YOY_Sales AS
(SELECT 
    company_name,
    COUNT(CASE WHEN year = '2019' THEN 1 END) AS sales_2019,
    COUNT(CASE WHEN year = '2020' THEN 1 END) AS sales_2020
FROM
    car_launches
GROUP BY company_name)

SELECT 
    company_name,
    (sales_2020 - sales_2019) as net_sales
FROM 
    YOY_Sales;
