/* Question 1: You are given the list of Facebook friends and the list of Facebook pages that users follow. Your task is to create a new recommendation system for Facebook. 
For each Facebook user, find pages that this user doesn't follow but at least one of their friends does. 
Output the user ID and the ID of the page that should be recommended to this user. */

/* Solution 1 */ 
/* This is not an optimal solution. When there are millions of rows, this query would be slow as we are using a Subquery to satisfy the 'WHERE' condition - 'NOT IN' */

WITH get_user_friend_pages AS(
SELECT A.user_id,
        A.friend_id,
        B.page_id as recommended_page_id
FROM
    users_friends A
INNER JOIN
    users_pages B
ON A.friend_id = B.user_id
)

SELECT user_id,
        recommended_page_id
FROM
    get_user_friend_pages
WHERE 
    (user_id, recommended_page_id) NOT IN (SELECT user_id,
                                            page_id
                                            FROM users_pages);

/* Soulutiob 1 */
/* Using Left Outer Join */

WITH get_user_friend_pages AS(
SELECT A.user_id,
        A.friend_id,
        B.page_id as recommended_page_id
FROM
    users_friends A
INNER JOIN
    users_pages B
ON A.friend_id = B.user_id
)

SELECT DISTINCT 
        gu.user_id, 
        gu.recommended_page_id
FROM
    get_user_friend_pages gu
LEFT JOIN users_pages up
ON (gu.user_id = up.user_id AND gu.recommended_page_id = up.page_id)
WHERE up.page_id is NULL; 
