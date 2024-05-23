-- UPDATABLE VIEWS

-- create view table
create view customer_view as 
SELECT customerNumber, customerName, contactLastName, contactFirstName FROM customers ;
-- update part 
update customer_view 
set contactFirstName = "NewFirstName"
where customerNumber = 45 ;
-- show table
select * from customer_view;


-- READ-ONLY VIEW 
create view order_product_view as
select od.orderNumber, p.productName, od.quantityOrdered
from orderdetails od 
join products p on od.productCode = p.productCode;
-- show table
select * from order_product_view;

-- INLINE VIEWS 
select iv.customerNumber, COUNT(iv.orderNumber) as total_order
from ( select customerNumber, orderNumber from orders)
as iv
group by iv.customerNumber;

-- MATERIALIZED VIEWS

-- stored procedure to create or refresh the materialized view table.
create procedure refresh_materialized_view()
begin
  drop table if exists materialized_view;
  create table materialized_view as
  select p.productname, sum(od.quantityordered) as totalquantityordered
  from orderdetails od 
  join products p on od.productcode = p.productcode
  group by p.productname;
end;
-- trigger to refresh the materialized view after each insert on orderdetails.
create trigger orderdetails_after_insert
after insert on orderdetails
for each row
call refresh_materialized_view();



