-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select Product.ProductName, Category.CategoryName from Product join Category on Product.CategoryId = Category.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select id, shipname from order where orderdate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select productname, quantity from order join orderdetail on order.id = orderdetail.orderid join product on orderdetail.productid = product.id;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select order.id, customer.companyname, employee.lastname from order join customer on order.customerid = customer.id join order.employeeid = employee.id;
