--列出在2004年曾經購買過每一種類別至少一項產品的客戶ID並排序。

--在2004年買過的客戶ID
select CustomerID 
from Orders 
where OrderDate between '2004' and '2005'

--每人在2004年所買每個種類的數量
select o.CustomerID,c.CategoryID,COUNT(*)as num  
from Orders o
join OrderDetails od on o.OrderID=od.OrderID
join Products p on od.ProductID=p.ProductID
join Categories c on p.CategoryID=c.CategoryID
where OrderDate between '2004' and '2005'
group by o.CustomerID,c.CategoryID
order by o.CustomerID,c.CategoryID

--ANS:每人買的種類總數(=8代表每種都有買)
select CustomerID from (
	select o.CustomerID,c.CategoryID  
	from Orders o
	join OrderDetails od on o.OrderID=od.OrderID
	join Products p on od.ProductID=p.ProductID
	join Categories c on p.CategoryID=c.CategoryID
	where OrderDate between '2004' and '2005'
	group by o.CustomerID,c.CategoryID
	) catcount 
group by CustomerID
having COUNT(*)= (select COUNT(*) from Categories)
