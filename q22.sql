--�s�W�@trigger�W��shippers_trigger�A����ƪ�Shippers�i��s�W�B�ק�B�R���ާ@��A
--�N�ާ@�������x��ShippersLog�]�w�s�b�^�A�����p�U�G

--*id
--	��identity�A�|�۰ʲ��͡A�ФŦs����ȡC
--*Time
--	datetime�A�O���ާ@�ɶ�
--*Operation
--	varchar(6)�A��Ȭ�'Insert'/'Delete'/'Update'
--*DelShipperId
--*DelCompany
--*DelPhone
--	��ƫ��A�PShippers�A�O���Q�R�������
--*InsShipperId
--*InsCompany
--*InsPhone
--	��ƫ��A�PShippers�A�O���s�W�����

--�Y��delete��insert�A�t�@�������Ҭ�NULL�C�Y��update�A�hDel�MIns���ݰO���C�`�N�G�Y�ާ@���v�T���ƪ�]�p���R����Ƥ��s�b�^�A�h���ݰO���C
--�X�f�P�X�f������ƪ�[�c


--Insert
CREATE TRIGGER TRG_InsertShipper 
ON Shippers
AFTER INSERT AS 
BEGIN 
	INSERT INTO shippersLog 
	(time,operation,InsshipperID,InsCompanyName,InsPhone)
	select GETDATE(),'Insert',shipperID,CompanyName,Phone from Inserted
END 
GO

DROP TRIGGER TRG_DeleteShipper 
GO

--Delete
CREATE TRIGGER TRG_DeleteShipper 
ON Shippers
AFTER DELETE AS 
BEGIN 
	INSERT INTO shippersLog 
	(time,operation,delshipperID,delCompanyName,delPhone)
	select GETDATE(),'Delete',shipperID,CompanyName,Phone from Deleted
END 
GO

DROP TRIGGER TRG_UpdateShipper 
GO

--Update
CREATE TRIGGER TRG_UpdateShipper 
ON Shippers
AFTER UPDATE AS 
BEGIN 
	INSERT INTO shippersLog 
	(time,operation,delshipperID,delCompanyName,delPhone,InsshipperID,InsCompanyName,InsPhone)
	select GETDATE(),'Update',d.shipperID,d.CompanyName,d.Phone,i.shipperID,i.CompanyName,i.Phone
	from Deleted d join Inserted i
	on d.shipperID=i.shipperID
END 
GO



--���ե�
--select * from Shippers
--go
--select * from ShippersLog
--go

--truncate table shipperslog

--Insert into Shippers VALUES('����=1999','999999')
--delete Shippers where ShipperID=4
--update Shippers set CompanyName='rrrrr' ,phone='333333' where ShipperID=5

--DROP TRIGGER TRG_InsertShipper 
--GO