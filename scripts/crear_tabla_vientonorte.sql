--CREATE TABLE vientonorte AS  
SELECT o.orderid, o.orderdate, o.requireddate, o.shippeddate, s.companyname as shipper, o.freight, od.unitprice, od.quantity, od.discount,  c.customerid, c.companyname as customercompany, c.city as customercity, c.region as customerregion, c.country as customercountry, p.productid, p.productname, cat.categoryname, cat.description as categorydescription, p.quantityperunit, p.unitprice AS productunitprice, e.lastname AS employeelastname, e.firstname AS employeefirstname, e.hiredate as employeehiredate, e.city as employeecity, e.region as employeeregion, e.country as employeecountry, sup.supplierid, sup.companyname as suppliercompanyname, sup.city as suppliercity, sup.region as supplierregion, sup.country as suppliercountry   FROM order_details od, orders o, customers c, products p , employees e, shippers s , categories cat, suppliers sup  WHERE sup.supplierid = p.supplierid AND  cat.categoryid = p.categoryid AND s.shipperid = shipvia AND e.employeeid = o.employeeid  AND p.productid = od.productid AND c.customerid = o.customerid AND od.orderid =  o.orderid  ;

