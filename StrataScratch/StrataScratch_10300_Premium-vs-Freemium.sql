/* Find the total number of downloads for paying and non-paying users by date.
Include only records where non-paying customers have more downloads than paying customers. 
The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads. 
Hint: In Oracle you should use "date" when referring to date column (reserved keyword). */
SELECT MD.date AS download_date,
        SUM(CASE WHEN MA.paying_customer = 'no' THEN MD.downloads END) AS non_paying,
        SUM(CASE WHEN MA.paying_customer = 'yes' THEN MD.downloads END) AS paying
FROM ms_acc_dimension MA
INNER JOIN ms_user_dimension MU on MA.acc_id = MU.acc_id
INNER JOIN ms_download_facts MD ON MD.user_id = MU.user_id
GROUP BY MD.date
HAVING SUM(CASE WHEN MA.paying_customer = 'no' THEN MD.downloads END)  > 
    SUM(CASE WHEN MA.paying_customer = 'yes' THEN MD.downloads END)
ORDER BY MD.date;


/* Key Takaway - Should use HAVING clause when we need to filter rows by agrregated columns* 
Because 'WHERE' Filters rows before aggregation & HAVING Filters rows after aggregation */
