-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.productName, c.categoryName 
FROM product as p
join category as c on c.Id = p.categoryId
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id, s.companyName
from [order] as o
left join shipper as s on s.Id = o.shipVia
where o.orderDate < '2012-08-09'
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select p.productName, od.quantity
from [product] as p 
join [orderDetail] as od on od.productId = p.Id
where od.orderId = 10251
order by p.productName
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.id, c.companyName, e.LastName
from [order] as o
join customer as c on c.id = o.customerId
join employee as e on e.id = o.employeeId
