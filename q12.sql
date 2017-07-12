--列出在2002年負責20筆以上訂單的員工ID並以員工ID排序。
select EmployeeID 
from Orders 
where OrderDate between '2002' and '2003' 
group by EmployeeID 
having COUNT(*)>=20
