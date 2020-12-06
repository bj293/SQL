-- Procedure to print 'Hello , World!!'

drop procedure if exists hello_world;
delimiter $$
create procedure hello_world()
begin
select 'Hello , World!!' as Message;
end $$
delimiter ;
call hello_world;



use ap;
drop procedure if exists test;

delimiter //

create procedure test()
begin
declare sum_balance_due_var decimal(9,2);
SELECT 
    SUM(invoice_total - payment_total - credit_total)
INTO sum_balance_due_var FROM
    invoices
WHERE
    vendor_id = 95;

if sum_balance_due_var>0 then
select concat("Balance due $",sum_balance_due_var) as message;

else
select 'balance paid in full' as message;

end if;
end//

delimiter ;
call test;




