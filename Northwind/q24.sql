--�b���u��ƪ��s�W�@���Seniority�A�䫬�A��int�A�Ȭ��ӭ��u�u�@��2004-12-31���~�� 
--(����ơB�����뤣��) �C


ALTER TABLE Employees
ADD Seniority int;
go

update Employees set Seniority=DATEDIFF (m,HireDate,'2004-12-31') where 1=1
