 -- Exercise 1
USE ap;
CREATE VIEW open_items (vendor_name , invoice_number , invoice_total , balance_due) AS
    SELECT 
        vendor_name,
        invoice_number,
        invoice_total,
        invoice_total - payment_total - credit_total
    FROM
        vendors v
            INNER JOIN
        invoices i ON v.vendor_id = i.vendor_id
    WHERE
        invoice_total - payment_total - credit_total > 0
    ORDER BY vendor_name;
        
  -- Exercise 2      
SELECT 
    *
FROM
    open_items
WHERE
    balance_due >= 1000;
    
-- Exercise 3
CREATE VIEW open_items_summary (vendor_name , open_items_count , open_item_total) AS
    SELECT 
        vendor_name,
        COUNT(*),
        SUM(invoice_total - payment_total - credit_total) AS open_item_total
    FROM
        vendors v
            INNER JOIN
        invoices i ON v.vendor_id = i.vendor_id
    GROUP BY vendor_name
    ORDER BY open_item_total DESC;

-- Exercise 4
SELECT 
    *
FROM
    open_items_summary
LIMIT 5;

-- Exercise 5
CREATE VIEW vendor_address AS
    SELECT 
        vendor_id, vendor_address1, vendor_address2
    FROM
        vendors;


-- Exercise 6
UPDATE vendor_address 
SET 
    vendor_address1 = '1990 Westwood Blvd',
    vendor_address2 = 'Ste 260'
WHERE
    vendor_id = 4;