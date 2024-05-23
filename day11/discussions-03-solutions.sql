
-- Write a query to display a list of customers who locate in the same city by joining the customers table to itself.
     select c1.city as City, c1.customerName as customerName, c2.customerName as customerName from customers c1, customers c2 
     where c1.customerNumber<>c2.customerNumber AND c1.city=c2.city order by c1.city;

-- Write a query to get:
    -- The productCode and productName from the products table.
    -- The textDescription of product lines from the productlines table.
    select p.productCode, p.productName, pl.textDescription from products p 
    inner join productlines pl on p.productLine=pl.productLine;
    
-- Write a query that returns order number, order status, and total sales from the orders and orderdetails tables as follows:
    select o.orderNumber, o.status, sum(od.quantityOrdered*od.priceEach) as total from orders o 
    inner join orderdetails od on o.orderNumber=od.orderNumber group by o.orderNumber;

-- Write a query to fetch the complete details of orders from the orders, orderDetails, and products table, and sort them by orderNumber and orderLineNumber as follows:
    select o.orderNumber,o.orderDate,od.orderLineNumber, p.productName, od.quantityOrdered, od.priceEach from orders o 
    inner join orderdetails od on o.orderNumber=od.orderNumber inner join products p on od.productCode=p.productCode 
    order by orderNumber,orderLineNumber;

-- Write a query to perform INNER JOIN of four tables:
    select o.orderNumber,o.orderdate,c.customerName,od.orderLineNumber,p.productName, od.quantityOrdered,od.priceEach from products p 
    inner join orderdetails od on p.productCode=od.productCode
    inner join orders o on od.orderNumber=o.orderNumber
    inner join customers c on o.customerNumber=c.customerNumber
    order by orderNumber,orderLineNumber;

-- Write a query to find the sales price of the product whose code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product as follows:
    select od.orderNumber, p.productName, msrp, priceEach from orderdetails od
    inner join products p on od.productCode=p.productCode
    where p.productCode = 'S10_1678' and priceEach<msrp;

-- Each customer can have zero or more orders while each order must belong to one customer. Write a query to find all the customers and their orders as follows:
    select c.customerNumber, c.customerName, o.ordernumber, o.status from customers c
    left join orders o on c.customerNumber=o.customerNumber;

-- Write a query that uses the LEFT JOIN to find customers who have no order:
    select c.customerNumber, c.customerName, o.ordernumber, o.status Ffrom customers c
    left join orders o on c.customerNumber=o.customerNumber and o.ordernumber is null;