--だ–ㄏノΩ计程砯笲よΑID

select sub2.Years,sub3.ShipVia 
from (
	--т–程计秖
	select Years, MAX(num) as num
	from 
	--т––贺よΑ计秖
		(select year(OrderDate) as Years,
		shipvia,
		count(*) as num from orders group by year(OrderDate),
		shipvia) sub 
	group by Years
) sub2 
join 
	--т计秖癸莱よΑID
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
