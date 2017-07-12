--在員工資料表中新增一欄位Seniority，其型態為int，值為該員工工作至2004-12-31的年資 
--(月份數、不足月不算) 。


ALTER TABLE Employees
ADD Seniority int;
go

update Employees set Seniority=DATEDIFF (m,HireDate,'2004-12-31') where 1=1
