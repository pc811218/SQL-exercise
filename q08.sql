--列出不提供肉/家禽類和海鮮類產品的供應商CompanyName並排序。
select distinct s.CompanyName 
from Products p 
join Categories c on p.CategoryID=c.CategoryID 
join Suppliers s on p.SupplierID=s.SupplierID
--找出不是下列廠商的廠商
where s.CompanyName not in (
	--subquery 提供這兩種的廠商
	select distinct s.CompanyName from Products p join Categories c on p.CategoryID=c.CategoryID join Suppliers s on p.SupplierID=s.SupplierID
	where c.CategoryName in ('肉/家禽','海鮮')
) 
order by s.CompanyName
