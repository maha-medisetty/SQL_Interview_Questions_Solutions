/* Count the total number of distinct conversations on WhatsApp. Two users share a conversation if there is at 
least 1 message between them. Multiple messages between the same pair of users are considered a single conversation. */
SELECT COUNT(*) AS total_conversations
FROM
    (
    SELECT sender_id AS user1, receiver_id AS user2 FROM messages
    UNION 
    SELECT receiver_id AS user1, sender_id AS user2 FROM messages
    ) AS all_pairs
WHERE user1 < user2;
