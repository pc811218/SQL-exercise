--�C�X�e�f������~���q��s���]ShippedDate�ߩ�RequiredDate�^�Ω��~�ѼƨåH�q��s���ƧǡC

select OrderID,DATEDIFF(d ,RequiredDate,ShippedDate)as DelayDays from orders
where ShippedDate>RequiredDate
order by OrderID