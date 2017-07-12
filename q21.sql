--依照客戶的送貨城市列出各城市訂購的各種類別的訂單數量。以ShipCity及Category排序。
--         (ShipCity)            (categoryID) (count)

--各城市的訂單總數
select ShipCity,COUNT(*) from Orders group by ShipCity

--ANS
select o.ShipCity,c.CategoryID,COUNT(*) 
from Orders o 
join OrderDetails od 
on o.OrderID=od.OrderID
join Products p
on od.ProductID=p.ProductID
join Categories c
on p.CategoryID=c.CategoryID
group by o.ShipCity,c.CategoryID
order by o.ShipCity,c.CategoryID
