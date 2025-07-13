-- 1. Get all available books (not issued or overdue)
SELECT b.book_id, b.title, b.author
FROM Book b
WHERE b.book_id NOT IN (
    SELECT book_id FROM Book_Issue WHERE status IN ('Issued', 'Overdue')
);

-- 2. Get full user profile
SELECT *
FROM User
WHERE email = 'user12@example.com';

-- 3. Get books issued to a user
SELECT bi.issue_id, b.title, bi.issue_date, bi.due_date, bi.status
FROM Book_Issue bi
JOIN Book b ON bi.book_id = b.book_id
WHERE bi.user_id = 1;

-- 4. Update book issue status on return
UPDATE Book_Issue
SET status = 'Returned', return_date = CURRENT_DATE
WHERE issue_id = 1;

-- 5. List overdue books and their count
SELECT b.book_id,COUNT(*) AS overdue_count
FROM Book b
JOIN Book_Issue bi ON b.book_id = bi.book_id
WHERE bi.status = 'Overdue'
GROUP BY b.book_id;

-- 6. List all active subscription plans
SELECT *
FROM Subscription_Plan
WHERE available = TRUE;

-- 7. Get the current active plan for a user
SELECT sp.*
FROM takes t
JOIN Subscription_Plan sp ON t.plan_id = sp.plan_id
WHERE t.user_id = 1
  AND CURRENT_DATE BETWEEN t.start_date AND t.end_date;

-- 8. Get payment history for a user
SELECT *
FROM Subscription_Payments
WHERE user_id = 1
ORDER BY payment_date DESC;

-- 9. Check if user has overdue books
SELECT COUNT(*) AS overdue_books
FROM Book_Issue
WHERE user_id = 1 AND status = 'Overdue';

-- 10. Add new feedback for a book
INSERT INTO Book_Feedback (feedback_id, rating, comment, user_id, book_id)
VALUES (DEFAULT, 5, 'Very insightful read!', 1, 1001);

-- 11. Get average rating for a book
SELECT AVG(rating) AS average_rating
FROM Book_Feedback
WHERE book_id = 1001;

-- 12. Top 5 most borrowed books
SELECT b.book_id, COUNT(*) AS borrow_count
FROM Book b
JOIN Book_Issue bi ON b.book_id = bi.book_id
GROUP BY b.book_id
ORDER BY borrow_count DESC
LIMIT 5;
 
-- 13. Number of users subscribed to each plan
SELECT sp.plan_id, COUNT(t.user_id) AS total_subscribers
FROM Subscription_Plan sp
LEFT JOIN takes t ON sp.plan_id = t.plan_id
GROUP BY sp.plan_id;

-- 14. Number of active subscribers for each plan
SELECT sp.plan_id, COUNT(t.user_id) AS active_users
FROM Subscription_Plan sp
LEFT JOIN takes t ON sp.plan_id = t.plan_id
WHERE CURRENT_DATE BETWEEN t.start_date AND t.end_date
GROUP BY sp.plan_id;

