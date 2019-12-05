--列出地址在屏東且提供至少三樣產品的供應商ID並排序。
select p.SupplierID 
from Products p join Suppliers s 
on p.SupplierID=s.SupplierID
--找出位在屏東的供應商 
where s.Region='屏東' 
--用SupplierID分類
group by p.SupplierID 
--篩出至少三樣的供應商
having COUNT(ProductID)>=3