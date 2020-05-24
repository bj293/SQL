-- Solved by: Brijesh Joshi

USE ap;

-- Exercise 1
SELECT 
    *
FROM
    vendors
        INNER JOIN
    invoices ON vendors.vendor_id = invoices.vendor_id;
 
 -- Exercise 2
SELECT 
    vendor_name,
    invoice_number,
    invoice_date,
    invoice_total - payment_total - credit_total AS balance_due
FROM
    vendors v
        INNER JOIN
    invoices i ON v.vendor_id = i.vendor_id
WHERE
    invoice_total - payment_total - credit_total > 0
ORDER BY vendor_name;


-- Exercise 3
SELECT 
    vendor_name, default_account_number, account_description
FROM
    vendors v
        INNER JOIN
    general_ledger_accounts g ON v.default_account_number = g.account_number
ORDER BY account_description , vendor_name;


-- Exercise 4
SELECT 
    vendor_name,
    invoice_date,
    invoice_number,
    invoice_sequence AS li_sequence,
    line_item_amount AS li_amount,
    invoice_id,
    vendor_id
FROM
    vendors v
        INNER JOIN
    invoices i USING (vendor_id)
        INNER JOIN
    invoice_line_items i_l_i USING (invoice_id)
ORDER BY vendor_name , invoice_date , invoice_number , invoice_sequence;

-- Exercise 5
SELECT 
    v1.vendor_id,
    v1.vendor_name,
    CONCAT(v1.vendor_contact_first_name,
            ' ',
            v1.vendor_contact_last_name) AS contact_name
FROM
    vendors v1
        INNER JOIN
    vendors v2 ON v1.vendor_contact_last_name = v2.vendor_contact_last_name
        AND v1.vendor_id != v2.vendor_id;
    
-- Exercise 6
SELECT 
    gl.account_number, account_description, invoice_id
FROM
    general_ledger_accounts gl
        LEFT JOIN
    invoice_line_items li ON gl.account_number = li.account_number
WHERE
    li.invoice_id IS NULL
ORDER BY gl.account_number;


-- Exercise 7
SELECT 
    vendor_name,vendor_state
FROM
    vendors
WHERE
    vendor_state = 'CA' 
UNION SELECT 
    vendor_name,'Outside CA'
FROM
    vendors
WHERE
    vendor_state <> 'CA';