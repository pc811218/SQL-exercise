--列出六月出生的員工姓名並排序。

select EmployeeName from Employees
where month(BirthDate)='6'
order by EmployeeName
