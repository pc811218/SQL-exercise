--�C�X�����Ѧ�/�a�V���M���A�����~��������CompanyName�ñƧǡC
select distinct s.CompanyName 
from Products p 
join Categories c on p.CategoryID=c.CategoryID 
join Suppliers s on p.SupplierID=s.SupplierID
--��X���O�U�C�t�Ӫ��t��
where s.CompanyName not in (
	--subquery ���ѳo��ت��t��
	select distinct s.CompanyName from Products p join Categories c on p.CategoryID=c.CategoryID join Suppliers s on p.SupplierID=s.SupplierID
	where c.CategoryName in ('��/�a�V','���A')
) 
order by s.CompanyName
