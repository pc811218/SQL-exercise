--�̷ӫȤ᪺�e�f�����C�X�U�����q�ʪ��U�����O���q��ƶq�C�HShipCity��Category�ƧǡC
--         (ShipCity)            (categoryID) (count)

--�U�������q���`��
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
