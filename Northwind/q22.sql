--新增一trigger名為shippers_trigger，當對資料表Shippers進行新增、修改、刪除操作後，
--將操作紀錄到日誌表ShippersLog（已存在），其欄位如下：

--*id
--	為identity，會自動產生，請勿存取其值。
--*Time
--	datetime，記錄操作時間
--*Operation
--	varchar(6)，其值為'Insert'/'Delete'/'Update'
--*DelShipperId
--*DelCompany
--*DelPhone
--	資料型態同Shippers，記錄被刪除的資料
--*InsShipperId
--*InsCompany
--*InsPhone
--	資料型態同Shippers，記錄新增的資料

--若為delete或insert，另一部分欄位皆為NULL。若為update，則Del和Ins都需記錄。注意：若操作未影響到資料表（如欲刪除資料不存在），則不需記錄。
--出貨與出貨紀錄資料表架構


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



--測試用
--select * from Shippers
--go
--select * from ShippersLog
--go

--truncate table shipperslog

--Insert into Shippers VALUES('測試=1999','999999')
--delete Shippers where ShipperID=4
--update Shippers set CompanyName='rrrrr' ,phone='333333' where ShipperID=5

--DROP TRIGGER TRG_InsertShipper 
--GO