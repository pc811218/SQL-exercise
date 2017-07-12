--�̷Ӧ~�ס]OrderDate�^�C�X�Ӧ~�׭q���`�ơB�`�q����B�]UnitPrice * Quantity * (1-Discount)�^ �B�����C���q����B�]���B�ҥ|�ˤ��J�ܤp���I��ĤG��^�åH�`���B�ƧǥѤj��p�ƧǡC
select datepart(yyyy, o.OrderDate) as Years,
COUNT(distinct o.OrderID) as Counts,
ROUND(SUM(od.Quantity*od.UnitPrice*(1-od.Discount)),2)as PriceSum,
ROUND(SUM(od.Quantity*od.UnitPrice*(1-od.Discount))/COUNT(distinct o.OrderID),2)as PriceAverage 
from Orders o join OrderDetails od on o.OrderID=od.OrderID 
group by datepart(yyyy, o.OrderDate)
order by PriceSum desc