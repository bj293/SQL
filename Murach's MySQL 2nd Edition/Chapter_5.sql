--Solved By: Brijesh Joshi
USE ap;


--Exercise 1
INSERT INTO terms VALUES (6,'Net due 120 days',120);

--Exercise 2
UPDATE terms 
SET 
    terms_description = 'Net due 125 days',
    terms_due_days = 125
WHERE
    terms_id = 6;


--Exercise 3
DELETE FROM terms 
WHERE
    terms_id = 6;


--Exercise 4
INSERT INTO invoices
VALUES (DEFAULT,32,"AX-014-027",08/01/2014,434.58,0,0,2,08/31/2014,NULL);


--