create database QLCB_BTVN#4_5
go
USE QLCB_BTVN#4_5
GO
CREATE TABLE PHANCONG (
	MANV nvarchar (15)  NOT NULL ,
	NGAYDI smalldatetime NOT NULL ,
	MACB nvarchar (3)  NOT NULL 
) 
GO

CREATE TABLE CHUYENBAY (
	MACB nvarchar (3)  NOT NULL ,
	SBDI nvarchar (3)  NULL ,
	SBDEN nvarchar (3)  NULL ,
	GIODI smalldatetime NULL ,
	GIODEN smalldatetime NULL 
) 
GO

CREATE TABLE KHACHHANG (
	MAKH nvarchar (15) NOT NULL,
	TEN nvarchar (15)  NULL ,
	DCHI nvarchar (50)  NULL ,
	DTHOAI nvarchar (15)  NULL 
) 
GO

CREATE TABLE DATCHO (
	MAKH nvarchar (15)  NOT NULL ,
	NGAYDI smalldatetime NOT NULL ,
	MACB nvarchar (3)  NOT NULL 
) 
GO

CREATE TABLE KHANANG (
	MANV nvarchar (15)  NOT NULL ,
	MALOAI nvarchar (15)  NOT NULL 
) 
GO

CREATE TABLE LICHBAY (
	NGAYDI smalldatetime NOT NULL ,
	MACB nvarchar (3)  NOT NULL ,
	SOHIEU smallint NULL ,
	MALOAI nvarchar (15)  NULL 
) 
GO

CREATE TABLE LOAIMB (
	HANGSX nvarchar (15)  NULL ,
	MALOAI nvarchar (15)  NOT NULL 
) 
GO

CREATE TABLE MAYBAY (
	SOHIEU smallint NOT NULL ,
	MALOAI nvarchar (15)  NOT NULL 
) 
GO

CREATE TABLE NHANVIEN (
	MANV nvarchar (15)  NOT NULL ,
	TEN nvarchar (15)  NULL ,
	DCHI nvarchar (50)  NULL ,
	DTHOAI nvarchar (15)  NULL ,
	LUONG float NULL ,
	LOAINV bit NULL 
) 
GO

ALTER TABLE PHANCONG  ADD 
	CONSTRAINT PK_PHANCONG PRIMARY KEY   
	(
		MANV,
		NGAYDI,
		MACB
	)   
GO

ALTER TABLE CHUYENBAY  ADD 
	CONSTRAINT PK_CHUYENBAY PRIMARY KEY   
	(
		MACB
	)   
GO

ALTER TABLE KHACHHANG  ADD 
	CONSTRAINT PK_KHACHHANG PRIMARY KEY   
	(
		MAKH
	)   
GO

ALTER TABLE DATCHO  ADD 
	CONSTRAINT PK_DATCHO PRIMARY KEY   
	(
		MAKH,
		NGAYDI,
		MACB
	)   
GO

ALTER TABLE KHANANG  ADD 
	CONSTRAINT PK_KHANANG PRIMARY KEY   
	(
		MANV,
		MALOAI
	)   
GO

ALTER TABLE LICHBAY  ADD 
	CONSTRAINT PK_LICHBAY PRIMARY KEY   
	(
		NGAYDI,
		MACB
	)   
GO

ALTER TABLE LOAIMB  ADD 
	CONSTRAINT PK_LOAIMB PRIMARY KEY   
	(
		MALOAI
	)   
GO

ALTER TABLE MAYBAY  ADD 
	CONSTRAINT PK_MAYBAY PRIMARY KEY   
	(
		SOHIEU,
		MALOAI
	)   
GO

ALTER TABLE NHANVIEN  ADD 
	CONSTRAINT PK_NHANVIEN PRIMARY KEY   
	(
		MANV
	)   
GO

ALTER TABLE PHANCONG ADD 
	CONSTRAINT FK_PHANCONG_LICHBAY FOREIGN KEY 
	(
		NGAYDI,
		MACB
	) REFERENCES LICHBAY (
		NGAYDI,
		MACB
	),
	CONSTRAINT FK_PHANCONG_NHANVIEN FOREIGN KEY 
	(
		MANV
	) REFERENCES NHANVIEN (
		MANV
	)
GO

ALTER TABLE DATCHO ADD 
	CONSTRAINT FK_DATCHO_KHACHHANG FOREIGN KEY 
	(
		MAKH
	) REFERENCES KHACHHANG (
		MAKH
	),
	CONSTRAINT FK_DATCHO_LICHBAY FOREIGN KEY 
	(
		NGAYDI,
		MACB
	) REFERENCES LICHBAY (
		NGAYDI,
		MACB
	)
GO

ALTER TABLE KHANANG ADD 
	CONSTRAINT FK_KHANANG_LOAIMB FOREIGN KEY 
	(
		MALOAI
	) REFERENCES LOAIMB (
		MALOAI
	),
	CONSTRAINT FK_KHANANG_NHANVIEN FOREIGN KEY 
	(
		MANV
	) REFERENCES NHANVIEN (
		MANV
	)
GO

ALTER TABLE LICHBAY ADD 
	CONSTRAINT FK_LICHBAY_CHUYENBAY FOREIGN KEY 
	(
		MACB
	) REFERENCES CHUYENBAY (
		MACB
	),
	CONSTRAINT FK_LICHBAY_MAYBAY FOREIGN KEY 
	(
		SOHIEU,
		MALOAI
	) REFERENCES MAYBAY (
		SOHIEU,
		MALOAI
	)
GO

ALTER TABLE MAYBAY ADD 
	CONSTRAINT FK_MAYBAY_LOAIMB FOREIGN KEY 
	(
		MALOAI
	) REFERENCES LOAIMB (
		MALOAI
	)
GO


INSERT INTO KHACHHANG
VALUES ('0101','Anh','567 Tran Phu','8826729')
INSERT INTO KHACHHANG
VALUES ('0009','Nga','223 Nguyen Trai','8932320')
INSERT INTO KHACHHANG
VALUES ('0045','Thu','285 Le Loi','8932203')
INSERT INTO KHACHHANG
VALUES ('0012','Ha','435 Quang Trung','8933232')
INSERT INTO KHACHHANG
VALUES ('0238','Hung','456 Pasteur','9812101')
INSERT INTO KHACHHANG
VALUES ('0397','Huong','234 Le van Sy','8952943')
INSERT INTO KHACHHANG
VALUES ('0582','Mai','789 Nguyen Du','')
INSERT INTO KHACHHANG
VALUES ('0934','Minh','678 Le Lai','')
INSERT INTO KHACHHANG
VALUES ('0091','Hai','345 Hung Vuong','8893223')
INSERT INTO KHACHHANG
VALUES ('0314','Phuong','395 Vo van Tan','8232320')
INSERT INTO KHACHHANG
VALUES ('0613','Vu','348 CMT8','8343232')
INSERT INTO KHACHHANG
VALUES ('0586','Son','123 Bach Dang','8556223')
INSERT INTO KHACHHANG
VALUES ('0422','Tien','75 Nguyen Thong','8332222')
GO

INSERT INTO NHANVIEN
VALUES ('1001','Huong','8 Dien Bien Phu','8330733',50000,1)
INSERT INTO NHANVIEN
VALUES ('1002','Phong','1 Ly Thuong Kiet', '8308117',45000,1)
INSERT INTO NHANVIEN
VALUES ('1003','Quang','78 Truong Dinh', '8234461',35000,1)
INSERT INTO NHANVIEN
VALUES ('1004','Phuong','351 Lac Long Quan', '8308155',25000,0)
INSERT INTO NHANVIEN
VALUES ('1005','Giao','65 Nguyen Thai Son','8324467',5000000,0)
INSERT INTO NHANVIEN
VALUES ('1006','Chi','12/6 Nguyen Kiem','8120012',150000,0)
INSERT INTO NHANVIEN
VALUES ('1007','Tam','36 Nguyen Van Cu', '8458188',500000,0)
GO

INSERT INTO CHUYENBAY
VALUES ('100','SLC','BOS','08:00','17:50')
INSERT INTO CHUYENBAY
VALUES ('112','DCA','DEN','14:00','18:07')
INSERT INTO CHUYENBAY
VALUES ('121','STL','SLC','07:00','09:13')
INSERT INTO CHUYENBAY
VALUES ('122','STL','YYV','08:03','10:19')
INSERT INTO CHUYENBAY
VALUES ('206','DFW','STL','09:00','11:40')
INSERT INTO CHUYENBAY
VALUES ('330','JFK','YYV','16:00','18:53')
INSERT INTO CHUYENBAY
VALUES ('334','ORD','MIA','12:00','14:14')
INSERT INTO CHUYENBAY
VALUES ('335','MIA','ORD','15:00','17:14') 
INSERT INTO CHUYENBAY
VALUES ('336','ORD','MIA','18:00','20:14')
INSERT INTO CHUYENBAY
VALUES ('337','MIA','ORD','20:30','23:53')
INSERT INTO CHUYENBAY
VALUES ('394','DFW','MIA','19:00','21:30')
INSERT INTO CHUYENBAY
VALUES ('395','MIA','DFW','21:00','23:43')
INSERT INTO CHUYENBAY
VALUES ('449','CDG','DEN','10:00','19:29')
INSERT INTO CHUYENBAY
VALUES ('930','YYV','DCA','13:00','16:10')
INSERT INTO CHUYENBAY
VALUES ('931','DCA','YYV','17:00','18:10')
INSERT INTO CHUYENBAY
VALUES ('932','DCA','YYV','18:00','19:10')
INSERT INTO CHUYENBAY
VALUES ('991','BOS','ORD','17:00','18:22')
GO

INSERT INTO LOAIMB
VALUES ('Airbus','A310')
INSERT INTO LOAIMB
VALUES ('Airbus','A320')
INSERT INTO LOAIMB
VALUES ('Airbus','A330')
INSERT INTO LOAIMB
VALUES ('Airbus','A340')
INSERT INTO LOAIMB
VALUES ('Boeing','B727')
INSERT INTO LOAIMB
VALUES ('Boeing','B747')
INSERT INTO LOAIMB
VALUES ('Boeing','B757')
INSERT INTO LOAIMB
VALUES ('MD','DC10')
INSERT INTO LOAIMB
VALUES ('MD','DC9')
GO

INSERT INTO MAYBAY
VALUES (10,'B747')
INSERT INTO MAYBAY
VALUES (11,'B727')
INSERT INTO MAYBAY
VALUES (13,'B727')
INSERT INTO MAYBAY
VALUES (13,'B747')
INSERT INTO MAYBAY
VALUES (21,'DC10')
INSERT INTO MAYBAY
VALUES (21,'DC9')
INSERT INTO MAYBAY
VALUES (22,'B757')
INSERT INTO MAYBAY
VALUES (22,'DC9')
INSERT INTO MAYBAY
VALUES (23,'DC9')
INSERT INTO MAYBAY
VALUES (24,'DC9')
INSERT INTO MAYBAY
VALUES (70,'A310')
INSERT INTO MAYBAY
VALUES (80,'A320')
INSERT INTO MAYBAY
VALUES (93,'B757')
GO

INSERT INTO KHANANG
VALUES ('1001','B727')
INSERT INTO KHANANG
VALUES ('1001','B747')
INSERT INTO KHANANG
VALUES ('1001','DC10')
INSERT INTO KHANANG
VALUES ('1002','A320')
INSERT INTO KHANANG
VALUES ('1002','A340')
INSERT INTO KHANANG
VALUES ('1002','B757')
INSERT INTO KHANANG
VALUES ('1002','DC9')
INSERT INTO KHANANG
VALUES ('1003','A310')
INSERT INTO KHANANG
VALUES ('1003','DC9')
GO

INSERT INTO LICHBAY
VALUES ('2000-10-31','100',10,'B747')
INSERT INTO LICHBAY
VALUES ('2000-10-31','112',11,'B727')
INSERT INTO LICHBAY
VALUES ('2000-10-31','206',13,'B727')
INSERT INTO LICHBAY
VALUES ('2000-10-31','334',10 ,'B747')
INSERT INTO LICHBAY
VALUES ('2000-10-31','335',10,'B747')
INSERT INTO LICHBAY
VALUES ('2000-10-31','337',24,'DC9')
INSERT INTO LICHBAY
VALUES ('2000-10-31','449',70,'A310')
INSERT INTO LICHBAY
VALUES ('2000-11-01','100',80,'A320')
INSERT INTO LICHBAY
VALUES ('2000-11-01','112',21,'DC10')
INSERT INTO LICHBAY
VALUES ('2000-11-01','206',22,'DC9')
INSERT INTO LICHBAY
VALUES ('2000-11-01','334',10,'B747')
INSERT INTO LICHBAY
VALUES ('2000-11-01','337',10,'B747')
INSERT INTO LICHBAY
VALUES ('2000-11-01','395',23,'DC9')
INSERT INTO LICHBAY
VALUES ('2000-11-01','991',22,'B757')
GO

INSERT INTO PHANCONG
VALUES ('1001','2000-10-31','100')
INSERT INTO PHANCONG
VALUES ('1001','2000-11-01','100')
INSERT INTO PHANCONG
VALUES ('1002','2000-10-31','100')
INSERT INTO PHANCONG
VALUES ('1002','2000-11-01','100')
INSERT INTO PHANCONG
VALUES ('1003','2000-10-31','100')
INSERT INTO PHANCONG
VALUES ('1003','2000-10-31','337')
INSERT INTO PHANCONG
VALUES ('1004','2000-10-31','100')
INSERT INTO PHANCONG
VALUES ('1004','2000-10-31','337')
INSERT INTO PHANCONG
VALUES ('1005','2000-10-31','337')
INSERT INTO PHANCONG
VALUES ('1006','2000-10-31','337')
INSERT INTO PHANCONG
VALUES ('1006','2000-11-01','991')
INSERT INTO PHANCONG
VALUES ('1007','2000-10-31','206')
INSERT INTO PHANCONG
VALUES ('1007','2000-11-01','112')
INSERT INTO PHANCONG
VALUES ('1007','2000-11-01','991')
GO

INSERT INTO DATCHO
VALUES ('0009','2000-10-31','449')
INSERT INTO DATCHO
VALUES ('0009','2000-11-01','100')
INSERT INTO DATCHO
VALUES ('0045','2000-11-01','991')
INSERT INTO DATCHO
VALUES ('0012','2000-10-31','206')
INSERT INTO DATCHO
VALUES ('0238','2000-10-31','334')
INSERT INTO DATCHO
VALUES ('0582','2000-11-01','991')
INSERT INTO DATCHO
VALUES ('0091','2000-11-01','100')
INSERT INTO DATCHO
VALUES ('0314','2000-10-31','449')
INSERT INTO DATCHO
VALUES ('0613','2000-11-01','100')
INSERT INTO DATCHO
VALUES ('0586','2000-10-31','100')
INSERT INTO DATCHO
VALUES ('0586','2000-11-01','991')
INSERT INTO DATCHO
VALUES ('0422','2000-10-31','449')
GO
-------------------------------
--------Truy vấn sử dụng-------
----hàm kết hợp và gom nhóm----
-------------------------------

--Họ và tên: Phan Trí Nguyên
--MSSV: 20127578
--Lớp: 20CLC05

-- CAU 17: Với mỗi sân bay (SBDEN), 
--	cho biết số lượng chuyến bay hạ cánh xuống sân bay đó
--	Kết quả được sắp xếp theo thứ tự tăng dần của sân bay đến.

SELECT CB.SBDEN as 'Sân bay đến', COUNT(*) AS 'Số lượng chuyến bay hạ cánh'
FROM CHUYENBAY CB
GROUP BY CB.SBDEN
ORDER BY COUNT(*) ASC

-- CAU 18: Với mỗi sân bay (SBDI),
--	cho biết số lượng chuyến bay xuất phát từ sân bay đó,
--	sắp xếp theo thứ tự tăng dần của sân bay xuất phát

SELECT CB.SBDI as 'Sân bay đi', COUNT(*) AS 'Số lượng chuyến bay xuất phát'
FROM CHUYENBAY CB
GROUP BY CB.SBDI
ORDER BY COUNT(*) ASC

-- CAU 19: Với mỗi sân bay (SBDI), sama
--	cho biết số lượng chuyến bay xuất phát theo từng ngày
--	Xuất ra mã sân bay đi, ngày và số lượng

SELECT CB.SBDI 'Mã sân bay đi', DAY(LB.NGAYDI) 'Ngày', COUNT(DISTINCT LB.NGAYDI) 'Số lượng chuyến bay xuất phát'
FROM CHUYENBAY CB JOIN LICHBAY LB
ON CB.MACB = LB.MACB
GROUP BY CB.SBDI, DAY(LB.NGAYDI)

-- CAU 20: Với mỗi sân bay (SBDEN), sama
--	cho biết số lượng chuyến bay hạ cánh theo từng ngày
--	Xuất ra mã sân bay đến, ngày và số lượng


SELECT DISTINCT CB.SBDEN N'Mã sân bay đến', DAY(LB.NGAYDI) N'Ngày', COUNT(DISTINCT LB.NGAYDI) N'Số lượng chuyến bay xuất phát'
FROM CHUYENBAY CB join LICHBAY LB
ON CB.MACB = LB.MACB
GROUP BY CB.SBDEN, day(LB.NGAYDI)
-- CAU 21: Với mỗi lịch bay,
--	cho biết mã chuyến bay, ngày đi 
--	cùng với số lượng nhân viên không phải là phi công của chuyến bay đó.

SELECT DISTINCT LB.MACB AS 'Mã chuyến bay', LB.NGAYDI AS 'Ngày đi', COUNT(NV.LOAINV) AS 'Số lượng nhân viên của chuyến bay'
FROM LICHBAY LB JOIN PHANCONG PC
ON LB.MACB = PC.MACB AND PC.NGAYDI = LB.NGAYDI
JOIN NHANVIEN NV
ON PC.MANV = NV.MANV AND NV.LOAINV != 1
GROUP BY LB.MACB, LB.NGAYDI

-- câu 22: Số lượng chuyến bay xuất phát từ sân bay MIA vào ngày 11/01/2000.
SELECT COUNT(*) AS 'Số lượng chuyến bay xuất phát từ sân bay MIA vào ngày 11/01/2000'
FROM CHUYENBAY CB JOIN PHANCONG PC
ON CB.SBDI = 'MIA'
AND PC.NGAYDI = '2000-11-01'
AND CB.MACB = PC.MACB

-- câu 23: Với mỗi chuyến bay,
--	cho biết mã chuyến bay, ngày đi, số lượng nhân viên được phân công trên chuyến bay đó
--	sắp theo thứ tự giảm dần của số lượng.

SELECT CB.MACB AS 'Mã chuyến bay', PC.NGAYDI as 'Ngày đi', COUNT(NV.MANV) AS 'Số lượng nhân viên'--,COUNT(*)
FROM CHUYENBAY CB JOIN PHANCONG PC
ON CB.MACB = PC.MACB -- tạo liên kết CHUYENBAY với PHANCONG
JOIN NHANVIEN NV
ON NV.MANV = PC.MANV -- tạo liên kết NHANVIEN với PHANCONG
GROUP BY CB.MACB, PC.NGAYDI
ORDER BY COUNT(NV.MANV) DESC

-- câu 24: Với mỗi chuyến bay,
--	cho biết mã chuyến bay, ngày đi, cùng với số lượng hành khách đã đặt chỗ của chuyến bay đó
--	, sắp theo thứ tự giảm dần của số lượng

SELECT CB.MACB as 'Mã chuyến bay', DC.NGAYDI as 'Ngày đi', COUNT(*) AS 'Số lượng hành khách đã đặt chỗ'
FROM DATCHO DC JOIN KHACHHANG KH
ON DC.MAKH = KH.MAKH
JOIN CHUYENBAY CB
ON CB.MACB = DC.MACB
GROUP BY CB.MACB, DC.NGAYDI
ORDER BY COUNT(*) DESC

-- câu 25: Với mỗi chuyến bay,
--	cho biết mã chuyến bay, ngày đi, tổng lương của phi hành đoàn
--	(các nhân viên được phân công trong chuyến bay),
--	sắp xếp theo thứ tự tăng dần của tổng lương

SELECT CB.MACB as 'Mã chuyến bay', PC.NGAYDI as 'Ngày đi', SUM(NV.LUONG) as 'Tổng lương của phi hành đoàn'
FROM CHUYENBAY CB JOIN PHANCONG PC
ON CB.MACB = PC.MACB
JOIN NHANVIEN NV
ON NV.MANV = PC.MANV
GROUP BY CB.MACB, PC.NGAYDI
ORDER BY SUM(NV.LUONG) ASC

-- CAU 26: Cho biết lương trung bình của các nhân viên không phải là phi công

SELECT AVG(NV.LUONG) AS 'Lương trung bình của các nhân viên không phải là phi công'
FROM NHANVIEN NV
WHERE NV.LOAINV != '1'

-- CAU 27: Cho biết mức lương trung bình của các phi công

SELECT AVG(NV.LUONG) AS 'Mức lương trung bình của các phi công'
FROM NHANVIEN NV
WHERE NV.LOAINV = '1'

-- CAU 28: Với mỗi loại máy bay
--	, cho biết số lượng chuyến bay 
--	đã bay trên loại máy bay đó
--	hạ cánh xuống sân bay ORD. 
--	Xuất ra mã loại máy bay, số lượng chuyến bay.

SELECT LB.MALOAI as 'Mã loại máy bay', COUNT(*) AS 'Số lượng chuyến bay'
FROM CHUYENBAY CB JOIN LICHBAY LB
ON CB.SBDEN = 'ORD'
AND CB.MACB = LB.MACB
GROUP BY LB.MALOAI

-- câu 29: Cho biết sân bay (SBDI)
--	và số lượng chuyến bay có nhiều hơn 2 chuyến bay
--	xuất phát trong khoảng 10 giờ đến 22 giờ

SELECT CB.SBDI as 'Sân bay đi', COUNT(*) AS 'Số lượng chuyến bay'
FROM CHUYENBAY CB
WHERE DATEPART(HOUR,CB.GIODI) >= 10 
AND DATEPART(HOUR,CB.GIODI) <= 22 -- hoặc dùng GIODI BETWEEN '10:00' AND '22:00'
GROUP BY CB.SBDI
HAVING COUNT(*) > 2

-- câu 30: Cho biết tên phi công 
--	được phân công vào ít nhất 2 chuyến bay ( >= 2 CB)
--	trong cùng một ngày. => chưa bik giải

SELECT NV.TEN as 'Tên phi công'
FROM NHANVIEN NV join PHANCONG PC
on NV.MANV = PC.MANV
AND NV.LOAINV = '1'
JOIN PHANCONG PC_TEMP
ON PC.NGAYDI = PC_TEMP.NGAYDI
AND PC.MANV = NV.MANV -- tạo LK với biến tạm PC1
AND PC_TEMP.MANV = NV.MANV -- tạo LK với biến tạm PC1
AND PC.MANV = PC_TEMP.MANV -- Mã nhân viên của 2 bảng PHANCONG phải trùng nhau => để cùng là 1 nhân viên
AND PC.MACB != PC_TEMP.MACB -- mã chuyến bay của 2 PHANCONG này phải khác nhau => phân công vào các chuyến bay khác nhau
GROUP BY NV.TEN
HAVING COUNT(DISTINCT PC.MACB) >= 2

-- câu 31: Cho biết mã chuyến bay và ngày đi
--	của những chuyến bay có ít hơn 3 hành khách ( < 3 KH) đặt chỗ

SELECT CB.MACB as 'Mã chuyến bay', PC.NGAYDI as 'Ngày đi'--, COUNT(DISTINCT DC.MAKH)
FROM CHUYENBAY CB join DATCHO DC
ON CB.MACB = DC.MACB
join PHANCONG PC
ON CB.MACB = PC.MACB
GROUP BY CB.MACB, PC.NGAYDI
HAVING COUNT(DC.MAKH) < 3 -- => ko bik có DISTINCT hay không ?

-- câu 32: Cho biết số hiệu máy bay và loại máy bay
--	mà phi công có mã 1001 
--	được phân công lái trên 2 lần.

SELECT MB.SOHIEU AS 'Số hiệu', MB.MALOAI AS 'Mã loại'
FROM KHANANG KN join NHANVIEN NV
ON NV.MANV = KN.MANV -- tạo liên kết KHANANG với NHANVIEN
JOIN MAYBAY MB
ON MB.MALOAI = KN.MALOAI -- tạo liên kết MAYBAY với KHANANG
AND NV.MANV = '1001' -- phi công có mã 1001
JOIN PHANCONG PC
ON NV.MANV = PC.MANV -- tạo liên kết NHANVIEN với PHANCONG
GROUP BY MB.SOHIEU, MB.MALOAI
HAVING COUNT(PC.MANV) > 2 -- được phân công lái trên 2 lần

-- câu 33: Với mỗi hãng sản xuất,
--	cho biết số lượng loại máy bay mà hãng đó đã sản xuất.
--	Xuất ra hãng sản xuất và số lượng

SELECT LMB.HANGSX, COUNT(LMB.MALOAI) AS N'Số lượng loại máy bay mà hãng đã sản xuất'
FROM LOAIMB LMB
GROUP BY LMB.HANGSX

-------------------------------
--------Truy vấn sử dụng-------
----hàm kết hợp và gom nhóm----
-------------------------------
-- các toán tử IN, NOT IN, ALL,ANY,SOME
-- các toán tử EXIST, NOT EXIST

-- câu 34: Cho biết hãng sản xuất,
--		mã loại 
--		và số hiệu 
--		của máy bay đã được sử dụng nhiều nhất.

SELECT LMB.HANGSX as N'hãng sản xuất', LMB.MALOAI AS N'mã loại', MB.SOHIEU AS N'số hiệu', COUNT(LB.MALOAI) AS N'Số lần của các máy bay được xử dụng nhiều nhất'
FROM LOAIMB LMB JOIN MAYBAY MB
ON LMB.MALOAI = MB.MALOAI -- tạo LK LOAIMB với MAYBAY
JOIN LICHBAY LB
ON LB.MALOAI = MB.MALOAI -- tạo LK LICHBAY với MAYBAY
GROUP BY LMB.HANGSX, LMB.MALOAI, MB.SOHIEU
HAVING COUNT(LB.MALOAI) >= ALL (SELECT COUNT(LB2.MALOAI)
								FROM LOAIMB LMB2 JOIN MAYBAY MB2
								ON LMB2.MALOAI = MB2.MALOAI -- tạo LK LOAIMB với MAYBAY
								JOIN LICHBAY LB2
								ON LB2.MALOAI = MB2.MALOAI
								GROUP BY LMB2.HANGSX, LMB2.MALOAI, MB2.SOHIEU
								)

-- câu 35: Cho biết tên nhân viên 
--		được phân công đi nhiều chuyến bay nhất

SELECT NV.TEN AS N'Tên nhân viên được phân công đi nhiều chuyến bay nhất'
FROM NHANVIEN NV JOIN PHANCONG PC
ON PC.MANV = NV.MANV
GROUP BY NV.TEN
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
						FROM NHANVIEN NV2 JOIN PHANCONG PC2
						ON PC2.MANV = NV2.MANV
						GROUP BY NV2.TEN
						)
-- câu 36: Cho biết thông tin của phi công (tên, địa chỉ, điện thoại)
--	lái nhiều chuyến bay nhất.

SELECT NV.TEN AS N'Tên của phi công lái nhiều chuyến bay nhất', NV.DCHI AS N'địa chỉ', NV.DTHOAI AS N'điện thoại'
FROM NHANVIEN NV JOIN PHANCONG PC
ON PC.MANV = NV.MANV
WHERE NV.LOAINV = '1'
GROUP BY NV.TEN, NV.DCHI, NV.DTHOAI
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
						FROM NHANVIEN NV2 JOIN PHANCONG PC2
						ON PC2.MANV = NV2.MANV
						WHERE NV2.LOAINV = '1'
						GROUP BY NV2.TEN, NV2.DCHI, NV2.DTHOAI
						)

-- câu 37: Cho biết sân bay (SBDEN) 
--	và số lượng chuyến bay 
--	của sân bay có ít chuyến bay đáp xuống nhất.

SELECT CB.SBDEN AS N'Tên sân bay có ít chuyến bay đáp xuống nhất', COUNT(*) AS N'Số lượng chuyến bay đáp xuống'
FROM CHUYENBAY CB
GROUP BY CB.SBDEN
HAVING COUNT(*) <= ALL (SELECT COUNT(*)
						FROM CHUYENBAY CB2
						GROUP BY CB2.SBDEN
						)

-- câu 38: Cho biết sân bay (SBDI) 
--	và số lượng chuyến bay 
--	của sân bay có nhiều chuyến bay xuất phát nhất

SELECT CB.SBDI AS N'Tên sân bay có nhiều chuyến bay xuất phát nhất', COUNT(*) AS N'Số lượng chuyến bay xuất phát'
FROM CHUYENBAY CB
GROUP BY CB.SBDI
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
						FROM CHUYENBAY CB2
						GROUP BY CB2.SBDI
						)

-- câu 39: Cho biết tên, địa chỉ, và điện thoại của khách hàng
--	đã đi trên nhiều chuyến bay nhất.


SELECT KH.TEN AS N'Họ tên Khách hàng', KH.DCHI AS N'Địa chỉ', KH.DTHOAI AS N'Số điện thoại', COUNT(*) AS N'Số lượng chuyến bay đã đi nhiều nhất'
FROM KHACHHANG KH JOIN DATCHO DC
ON KH.MAKH = DC.MAKH
GROUP BY KH.TEN, KH.DCHI, KH.DTHOAI
HAVING COUNT(*) >= ALL (SELECT COUNT(*)
							FROM DATCHO DC2
							GROUP BY DC2.MAKH
							)

-- câu 40: Cho biết mã số, tên và lương của các phi công
--	có khả năng lái nhiều loại máy bay nhất

SELECT NV.MANV, NV.TEN, NV.LUONG, COUNT(*)
FROM NHANVIEN NV JOIN KHANANG KN ON NV.MANV = KN.MANV
WHERE NV.LOAINV = '1'
GROUP BY NV.MANV, NV.TEN, NV.LUONG
HAVING COUNT(KN.MALOAI) >= ALL (SELECT COUNT(KN2.MALOAI)
								FROM KHANANG KN2
								GROUP BY KN2.MANV
								)

-- câu 41: Cho biết thông tin (mã nhân viên, tên, lương)
--	của nhân viên có mức lương cao nhất.

SELECT NV.MANV, NV.TEN, NV.LUONG
FROM NHANVIEN NV
WHERE NV.LUONG >= ALL (SELECT NV2.LUONG
						FROM NHANVIEN NV2
						)

-- câu 42: Cho biết tên, địa chỉ của các nhân viên
--	có lương cao nhất trong phi hành đoàn 
--	(các nhân viên được phân công trong một chuyến bay) mà người đó tham gia.

SELECT PC.MACB AS N'Phi hành đoàn', NV.TEN AS N'Họ tên nhân viên có lương cao nhất trong phi hành đoàn', NV.DCHI AS N'Địa chỉ'
FROM PHANCONG PC JOIN NHANVIEN NV ON PC.MANV = NV.MANV
GROUP BY MACB, NV.TEN, NV.DCHI, PC.MACB, NV.MANV, NV.LUONG
HAVING NV.LUONG >= ALL (SELECT NV2.LUONG
						FROM PHANCONG PC2 JOIN NHANVIEN NV2 ON PC2.MANV = NV2.MANV
						WHERE PC2.MACB = PC.MACB
						AND NV.MANV != NV2.MANV
						)

-- câu 43: Cho biết mã chuyến bay,
--	giờ đi 
--	và giờ đến 
--	của chuyến bay bay sớm nhất trong ngày

SELECT CB.MACB AS N'Mã chuyến bay bay sớm nhất trong ngày', CB.GIODI AS N'giờ đi', CB.GIODEN AS N'giờ đến'
FROM CHUYENBAY CB
WHERE CB.GIODI <= ALL (SELECT CB2.GIODI
						FROM CHUYENBAY CB2
						WHERE DATEPART(DAY,CB2.GIODI) = DATEPART(DAY,CB.GIODI)
						and DATEPART(MONTH,CB2.GIODI) = DATEPART(MONTH,CB.GIODI)
						and DATEPART(YEAR,CB2.GIODI) = DATEPART(YEAR,CB.GIODI)
						)

-- câu 44: Cho biết mã chuyến bay có thời gian bay dài nhất
--	. Xuất ra mã chuyến bay và thời gian bay (tính bằng phút)
-- tháng / ngày / năm
-- DATEDIFF(DAY,A,B)
-- ngày kết thúc - ngày bắt đầu = INT
--		   B	 -	    A		= INT

SELECT CB.MACB as N'Mã chuyến bay có thời gian bay dài nhất', DATEDIFF(MINUTE,CB.GIODI,CB.GIODEN) as N'Thời gian bay (tính bằng phút)'
FROM CHUYENBAY CB
WHERE DATEDIFF(MINUTE,CB.GIODI,CB.GIODEN) >= ALL (SELECT DATEDIFF(MINUTE,CB1.GIODI,CB1.GIODEN)
													FROM CHUYENBAY CB1
													)

-- câu 45: Cho biết mã chuyến bay có thời gian bay ít nhất
--	. Xuất ra mã chuyến bay và thời gian bay

SELECT CB.MACB as N'Mã chuyến bay có thời gian bay dài nhất', DATEDIFF(MINUTE,CB.GIODI,CB.GIODEN) as N'Thời gian bay (tính bằng phút)'
FROM CHUYENBAY CB
WHERE DATEDIFF(MINUTE,CB.GIODI,CB.GIODEN) <= ALL (SELECT DATEDIFF(MINUTE,CB1.GIODI,CB1.GIODEN)
													FROM CHUYENBAY CB1
													)

-- câu 46: Cho biết mã chuyến bay
--	và ngày đi của những chuyến bay
--	bay trên loại máy bay B747 nhiều nhất

SELECT DISTINCT CB.MACB as N'Mã chuyến bay', DATEPART(DAY,CB.GIODI) as N'Ngày đi của những chuyến bay bay trên loại máy bay B747 nhiều nhất'
FROM CHUYENBAY CB JOIN LICHBAY LB ON CB.MACB = LB.MACB
WHERE LB.MALOAI = 'B747'
GROUP BY CB.MACB, CB.GIODI
HAVING COUNT(LB.MACB) >= ALL (SELECT COUNT(LB2.MACB)
						FROM LICHBAY LB2
						WHERE LB2.MALOAI = 'B747'
						GROUP BY LB2.MACB
						)

-- câu 47: Với mỗi chuyến bay có trên 3 hành khách
--	, cho biết mã chuyến bay
--	và số lượng nhân viên trên chuyến bay đó
--	. Xuất ra mã chuyến bay
--	và số lượng nhân viên

SELECT DISTINCT DC.MACB as N'Mã chuyến bay có trên 3 hành khách', COUNT(DISTINCT DC.MAKH) as N'Số lượng hành khách', COUNT(DISTINCT PC.MANV) AS N'số lượng nhân viên trên chuyến bay đó'
FROM DATCHO DC JOIN PHANCONG PC ON DC.MACB = PC.MACB
GROUP BY DC.MACB, DC.MAKH
HAVING COUNT(DISTINCT DC.MAKH) > 3

SELECT LB.MACB, COUNT(DISTINCT PC.MANV) SOLUONGNHANVIEN
FROM DATCHO DC, PHANCONG PC, LICHBAY LB
WHERE DC.MACB = LB.MACB AND DC.NGAYDI = LB.NGAYDI AND PC.NGAYDI = LB.NGAYDI AND PC.MACB = LB.MACB
GROUP BY LB.MACB, LB.NGAYDI
HAVING COUNT(DISTINCT DC.MAKH) > 2

-- KQ = 100 - 4 - 6
--SELECT PC.MACB, COUNT(PC.MANV)
--FROM PHANCONG PC
--GROUP BY PC.MACB

--SELECT DC.MACB, COUNT(DC.MAKH)
--FROM DATCHO DC
--GROUP BY DC.MACB
--HAVING COUNT(DC.MAKH) > 3

-- câu 48: Với mỗi loại nhân viên có tổng lương trên 600000
--	, cho biết số lượng nhân viên trong từng loại nhân viên đó
--	. Xuất ra loại nhân viên
--	, và số lượng nhân viên tương ứng.

SELECT NV.LOAINV, COUNT(NV.MANV)
FROM NHANVIEN NV
GROUP BY LOAINV, NV.LUONG
HAVING SUM(NV.LUONG) > 600000

-- câu 49: Với mỗi chuyến bay có trên 3 nhân viên
--	, cho biết mã chuyến bay
--	và số lượng khách hàng đã đặt chỗ trên chuyến bay đó

SELECT LB.MACB as N'mã chuyến bay', COUNT(DISTINCT PC.MANV), COUNT(DISTINCT DC.MAKH) as N'số lượng khách hàng đã đặt chỗ trên chuyến bay đó'
FROM DATCHO DC, PHANCONG PC, LICHBAY LB
WHERE DC.MACB = LB.MACB 
AND DC.NGAYDI = LB.NGAYDI
AND PC.NGAYDI = LB.NGAYDI
AND PC.MACB = LB.MACB
GROUP BY LB.MACB, LB.NGAYDI
HAVING COUNT(DISTINCT PC.MANV) > 3

-- KQ = 100 - 4
--Với mỗi chuyến bay có trên 3 nhân viên
--SELECT PC.MACB, COUNT(PC.MANV)
--FROM PHANCONG PC
--GROUP BY PC.MACB
--HAVING COUNT(PC.MANV) > 3

--số lượng khách hàng trên mỗi chuyến bay
--SELECT DC.MACB, COUNT(DC.MAKH)
--FROM DATCHO DC
--GROUP BY DC.MACB

-- câu 50: Với mỗi loại máy bay có nhiều hơn một chiếc
--	, cho biết số lượng chuyến bay đã được bố trí bay bằng loại máy bay đó
--	. Xuất ra mã loại
--	và số lượng.

SELECT LB.MALOAI AS'mã loại máy bay có nhiều hơn một chiếc', COUNT(*) AS N'số lượng chuyến bay đã được bố trí bay bằng loại máy bay'
FROM LICHBAY LB
WHERE LB.MALOAI IN (SELECT MALOAI
					FROM MAYBAY MB
					GROUP BY MALOAI
					HAVING COUNT(*) > 1
					)
GROUP BY LB.MALOAI

SELECT *FROM CHUYENBAY CB
SELECT *FROM KHACHHANG KH
SELECT *FROM DATCHO DC
SELECT *FROM LICHBAY LB
SELECT *FROM MAYBAY MB
SELECT *FROM LOAIMB LMB
SELECT *FROM KHANANG KN
SELECT *FROM NHANVIEN NV
SELECT *FROM PHANCONG PC