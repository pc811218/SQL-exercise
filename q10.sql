--�C�X�b2004�~���g�ʶR�L�C�@�����O�ܤ֤@�����~���Ȥ�ID�ñƧǡC

--�b2004�~�R�L���Ȥ�ID
select CustomerID 
from Orders 
where OrderDate between '2004' and '2005'

--�C�H�b2004�~�ҶR�C�Ӻ������ƶq
select o.CustomerID,c.CategoryID,COUNT(*)as num  
from Orders o
join OrderDetails od on o.OrderID=od.OrderID
join Products p on od.ProductID=p.ProductID
join Categories c on p.CategoryID=c.CategoryID
where OrderDate between '2004' and '2005'
group by o.CustomerID,c.CategoryID
order by o.CustomerID,c.CategoryID

--ANS:�C�H�R�������`��(=8�N��C�س����R)
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
