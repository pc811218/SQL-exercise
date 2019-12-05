--查詢林姓員工的數量。
select COUNT(*) as EmpCount 
from Employees 
where EmployeeName like '林%'