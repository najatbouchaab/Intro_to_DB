-- This script inserts multiple new records into the 'customer' table of the alx_book_store database.

INSERT INTO customer (
    customer_id,
    customer_name,
    email,
    address
)
VALUES
    -- Record 1: Blessing Malik
    (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness Ave.'),

    -- Record 2: Obed Ehoneah
    (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness Ave.'),

    -- Record 3: Nehemial Kamolu
    (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness Ave.');
