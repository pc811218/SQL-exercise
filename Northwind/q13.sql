--���O�C�X�C�@�~�ϥΦ��Ƴ̦h���f�B�覡ID�C

select sub2.Years,sub3.ShipVia 
from (
	--��X�C�~�׳̦h���ƶq
	select Years, MAX(num) as num
	from 
	--��X�C�~�רC�ؤ覡���ƶq
		(select year(OrderDate) as Years,
		shipvia,
		count(*) as num from orders group by year(OrderDate),
		shipvia) sub 
	group by Years
) sub2 
join 
	--��X�ƶq�������覡ID
	(select year(OrderDate) as Years,
	shipvia,
	count(*) as num from orders group by year(OrderDate),
	shipvia
) sub3
on sub2.num=sub3.num
order by Years



--select year(OrderDate) as Years,shipvia,count(*) as num 
--from orders 
--group by year(OrderDate),shipvia
