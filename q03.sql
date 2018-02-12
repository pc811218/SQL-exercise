--列出所有性別是小姐且職稱是業務的員工姓名並依姓名排序。
select EmployeeName from Employees 
where TitleOfCourtesy='小姐' and Title='業務' 
order by EmployeeName