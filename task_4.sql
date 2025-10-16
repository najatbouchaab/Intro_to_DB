-- Task 4: Full description of the table 'books'
-- This script retrieves the full description of the 'books' table
-- without using DESCRIBE, EXPLAIN, or ANALYZE.

SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY, COLUMN_DEFAULT, EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'books';
