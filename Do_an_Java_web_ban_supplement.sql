USE MASTER
GO
IF EXISTS (SELECT NAME FROM SYS.DATABASES WHERE NAME= N'Do_an_Java')
DROP DATABASE Do_an_Java

GO 
create database Do_an_Java

go
use Do_an_Java  
 
GO 
create table Khach_Hang(
	id int identity primary key,
	ho_va_ten nvarchar(40),
	sdt nvarchar(50),
	mat_khau varchar(20),
	type_acc bit
)

go
insert into Khach_Hang values(N'Admin',N'1','1',0)
 
go 
create table thuong_hieu(
	id int identity primary key,
	ten_thuong_hieu nvarchar(50) 
) 

go 
insert into thuong_hieu values(N'Rule 1')
insert into thuong_hieu values(N'BPI')
insert into thuong_hieu values(N'Mutant')
insert into thuong_hieu values(N'NOW')
insert into thuong_hieu values(N'ON')
insert into thuong_hieu values(N'PERFECT')
insert into thuong_hieu values(N'Proteinfabrikken')
insert into thuong_hieu values(N'QUAKER')

go 
create table loai_sp(
	id int identity(1,1) primary key,
	ten_loai_sp nvarchar(50),
	banner nvarchar(200),
	id_cha int  
) 
go 
insert into loai_sp values(N'Whey',N'./images/Whey/banner.jpg',null)
insert into loai_sp values(N'Casein Protein',N'./images/Whey/Casein Protein/banner.jpg',1)
insert into loai_sp values(N'Hydrolyzed Whey',N'./images/Whey/Hydrolyzed Whey/banner.jpg',1)
insert into loai_sp values(N'Meal Replacement',N'./images/Whey/Meal Replacement/banner.jpg',1)
insert into loai_sp values(N'Protein Blend',N'./images/Whey/Protein Blend/banner.jpg',1)
insert into loai_sp values(N'Protein Isolate',N'./images/Whey/Protein Isolate/banner.jpg',1)
insert into loai_sp values(N'rule_1',N'./images/Whey/rule_1/banner.jpg',1)

insert into loai_sp values(N'Vitamin - Dầu cá',N'./images/Vitamin - Dầu cá/banner.jpg',null)

insert into loai_sp values(N'Pre-workout, Creatine',N'./images/Pre-workout, Creatine/banner.jpg',null)
insert into loai_sp values(N'Creatine',N'./images/Pre-workout, Creatine/Creatine/banner.jpg',9)
insert into loai_sp values(N'Pre-workout',N'./images/Pre-workout, Creatine/Pre-workout/banner.jpg',9)

insert into loai_sp values(N'Amino Acid, BCAAs',N'./images/Amino Acid, BCAAs/banner.jpg',null)

insert into loai_sp values(N'Phụ kiện',N'./images/Phụ kiện/banner.jpg',null)
 
 
go 
create table san_pham(
	id int identity primary key,
	id_thuong_hieu int,
	id_loai int,

	ten_san_pham nvarchar(50),
	gia_goc int,
	gia_ban int,

	so_luong_ton int,
	 
	mo_ta nvarchar(50),

	create_at datetime,
	update_at datetime,
	
	FOREIGN KEY (id_thuong_hieu) REFERENCES thuong_hieu(id),
	FOREIGN KEY (id_loai ) REFERENCES loai_sp(id), 
)
 
--insert into san_pham values(1,2,N'',900000,850000,5,N'',getdate(),getdate())
  
go
create table abum(
	id int identity primary key,
	id_sp int,

	hinh nvarchar(200),
	FOREIGN KEY (id_sp) REFERENCES san_pham(id)
)

create table Don_hang(
	id int identity primary key,
	ma_kh int,

	ten_kh nvarchar(50), 
	sdt nvarchar(12),
	dia_chi nvarchar(200),
	ghi_chu nvarchar(200),

	ngay_dat_hang datetime,
	tinh_trang bit,

	FOREIGN KEY (ma_kh) REFERENCES khach_hang(id) 
)

go
create table Chi_tiet_don_hang(
	id int identity primary key,

	ma_don_hang int,
	ma_sp int,

	gia bigint,
	so_luong int,
	
	
	FOREIGN KEY (ma_don_hang) REFERENCES don_hang(id),
	FOREIGN KEY (ma_sp) REFERENCES san_pham(id)
)

go
create table Phan_hoi_ve_sp(
	id int identity primary key,
	id_kh int,
	id_sp int,
	 
	thong_tin_phan_hoi nvarchar(200) 
	
	FOREIGN KEY (id_kh) REFERENCES khach_hang(id),
	FOREIGN KEY (id_sp) REFERENCES san_pham(id)
)