--�C�X2004�~�T���`������B�̦h��5�W���uID�Φ�����B�åH������B�Ѥj��p�ƧǡC

--�C���q�檺�`���B
select OrderID,SUM(UnitPrice*Quantity*(1-Discount)) as osum
from OrderDetails 
group by OrderID

--�b2004�~3��C���q���`���B
select * from (
	select OrderID,SUM(UnitPrice*Quantity*(1-Discount)) as osum
	from OrderDetails 
	group by OrderID)a
join Orders o
on a.OrderID=o.OrderID
where o.OrderDate>'2004-03-01' and o.OrderDate< '2004-04-01' 

--�C����u�b2004�~3�몺�q���`���B
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