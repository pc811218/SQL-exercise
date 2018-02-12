--列出處理2003年的前十筆訂單（以OrderDate排序）的員工ID。
select top 10 EmployeeID 
from Orders 
where OrderDate between '2003' and '2004' 
order by OrderDate