--列出曾在2004年（以OrderDate為主）處理訂單的員工ID（不得重複）並排序。
select distinct EmployeeID 
from Orders 
where OrderDate between '2004' and '2005'