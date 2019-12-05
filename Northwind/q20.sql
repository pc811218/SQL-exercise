--列出2003年平均每月訂單數。

--2003年總訂單
select * 
from Orders
where OrderDate >'2003' and OrderDate<'2004'

--2003年每個月的訂單數量
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

