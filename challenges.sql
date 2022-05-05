# Challenge 1: find the earliest data a user joined
# SELECT 
#    DATE_FORMAT(MIN(created_at), "%M %D %Y") AS earliest_date 
# FROM users;

#Challenge 2: Find the email address of the first users
 # SELECT email, created_at FROM users
 #    WHERE created_at = (SELECT MIN(created_at) AS earliest_date FROM users);
    
#Challenge 3: display how many users joined in each month
# SELECT 
#     DATE_FORMAT(created_at, "%M") AS month, 
#     COUNT(*) AS count
# FROM users
# GROUP BY month
# ORDER BY count DESC;

#Challenge 4: count the number of users with Yahoo emails
# SELECT COUNT(*) AS yahoo_users from users
# WHERE email LIKE '%@yahoo.com%'; 

#Challenge 5: caluculate the total number of users for each email host
# SELECT 
#       CASE
#         WHEN email LIKE '%@gmail.com%' THEN 'gmail'
#         WHEN email LIKE '%@yahoo.com%' THEN 'yahoo'
#         WHEN email LIKE '%@hotmail.com%' THEN 'hotmail'
#         ELSE 'other'
#     END as provider, 
#     COUNT(*) as total_users
# FROM users
# GROUP BY provider
# ORDER BY total_users; 