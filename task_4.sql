-- Display the full description of the table 'books'
SHOW FULL COLUMNS FROM books;
-- Print full description of the table 'books' without using DESCRIBE, EXPLAIN, or ANALYZE
SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY, COLUMN_DEFAULT, EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'books'
  AND TABLE_SCHEMA = DATABASE();
