--�C�X2003�~�����C��q��ơC

--2003�~�`�q��
select * 
from Orders
where OrderDate >'2003' and OrderDate<'2004'

--2003�~�C�Ӥ몺�q��ƶq
select month(OrderDate) as months,COUNT(*) as num
from Orders
where OrderDate >='2003' and OrderDate<'2004'
group by month(OrderDate)

--ANS
select AVG(num) as AvgOrderCnt
from (
	select month(OrderDate) as months,COUNT(*) as num
	from Orders
	where OrderDate >='2003' and OrderDate<'2004'
	group by month(OrderDate)) sub

