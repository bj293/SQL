--Solved By: Brijesh Joshi

USE ap;

--Exercise 1
SELECT 
    vendors.vendor_id, SUM(invoice_total) AS total_sum
FROM
    vendors
        INNER JOIN
    invoices ON vendors.vendor_id = invoices.vendor_id
GROUP BY vendors.vendor_id;

--Exercise 2
SELECT 
    vendor_name, SUM(payment_total) AS total_sum
FROM
    vendors
        INNER JOIN
    invoices ON vendors.vendor_id = invoices.vendor_id
GROUP BY vendors.vendor_id
ORDER BY total_sum;


--Exercise 3
SELECT 
    vendor_name, SUM(payment_total) AS total_sum
FROM
    vendors
        INNER JOIN
    invoices ON vendors.vendor_id = invoices.vendor_id
GROUP BY vendors.vendor_id
ORDER BY total_sum;


--Exercise 4
SELECT 
    account_description,
    SUM(line_item_amount) AS invoice_line_sum,
    COUNT(*)
FROM
    general_ledger_accounts g
        INNER JOIN
    invoice_line_items il ON g.account_number = il.account_number
        INNER JOIN
    invoices i ON i.invoice_id = il.invoice_id
WHERE
    invoice_date BETWEEN '2018-04-01' AND '2018-06-30'
GROUP BY account_description
HAVING COUNT(*) > 1
ORDER BY invoice_line_sum DESC;