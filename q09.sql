--�C�X�C�����~���O�@���h�ֲ��~�]���G���O�W�١B�ƶq�^�åHCategoryID�ƧǡC
select c.CategoryName,COUNT(*) as Num 
from Categories c 
join Products p on c.CategoryID=p.CategoryID 
group by c.CategoryName,c.CategoryID 
order by c.CategoryID
