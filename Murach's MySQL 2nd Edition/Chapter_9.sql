-- Solved By: Brijesh Joshi


-- Exercise 4
SELECT 
    invoice_number,
    invoice_date,
    DATE_ADD(invoice_date, INTERVAL 30 DAY),
    payment_date,
    DATEDIFF(payment_date, invoice_date),
    MONTH(invoice_date),
    YEAR(invoice_date)
FROM
    ap.invoices;