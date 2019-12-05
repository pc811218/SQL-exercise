--列出2004年三月總成交金額最多的5名員工ID及成交金額並以成交金額由大到小排序。

--每筆訂單的總金額
select OrderID,SUM(UnitPrice*Quantity*(1-Discount)) as osum
from OrderDetails 
group by OrderID

--在2004年3月每筆訂單總金額
select * from (
	select OrderID,SUM(UnitPrice*Quantity*(1-Discount)) as osum
	from OrderDetails 
	group by OrderID)a
join Orders o
on a.OrderID=o.OrderID
where o.OrderDate>'2004-03-01' and o.OrderDate< '2004-04-01' 

--每位員工在2004年3月的訂單總金額
select o.EmployeeID, SUM(os.osum)
from (
	select OrderID,SUM(UnitPrice*Quantity*(1-Discount)) as osum
	from OrderDetails 
	group by OrderID) os
join Orders o
on os.OrderID=o.OrderID
where o.OrderDate>'2004-03-01' and o.OrderDate< '2004-04-01' 
group by o.EmployeeID

--ANS
select top 5 o.EmployeeID, SUM(os.osum) as TotalPrice
from (
	select OrderID,SUM(UnitPrice*Quantity*(1-Discount)) as osum
	from OrderDetails 
	group by OrderID) os
join Orders o
on os.OrderID=o.OrderID
where o.OrderDate>'2004-03-01' and o.OrderDate< '2004-04-01' 
group by o.EmployeeID
order by TotalPrice desc