--�C�X�a�}�b�̪F�B���Ѧܤ֤T�˲��~��������ID�ñƧǡC
select p.SupplierID 
from Products p join Suppliers s 
on p.SupplierID=s.SupplierID
--��X��b�̪F�������� 
where s.Region='�̪F' 
--��SupplierID����
group by p.SupplierID 
--�z�X�ܤ֤T�˪�������
having COUNT(ProductID)>=3