create database danhsachSV;
use danhsachSV;

create table tblKhoa(
k_ID int not null primary key,
k_Ten varchar(20)
);

create table tblLop(
l_ID int not null primary key,
l_Ten varchar(20),
l_Khoa int,
foreign key (l_Khoa) references tblKhoa(k_ID)
);
create table tblSinhVien(
sv_Maso int not null primary key,
sv_Hodem varchar(30),
sv_Ten varchar(15),
sv_Ngaysinh date,
sv_Lop int,
sv_DiemTB float(3,2),
foreign key (sv_Lop) references tblLop(l_ID)
);

alter table tblSinhVien modify column sv_DiemTB double;
insert into tblKhoa value (1,'CNTT'),(2,'TNMT'),(3,'BCVT');
insert into tblLop value (1,'C01',1),(2,'C02',2),(3,'C03',3);
insert into tblSinhVien value (1,'Nguyen','Nam','1999-04-05',1,10.0),(2,'Nguyen','Hung','2000-10-04',2,8.2)
,(3,'Dang','Dung','1991-02-02',3,5.1);

select * from tblSinhVien;

select sv_Maso,concat(sv_Hodem , " ", sv_Ten) as 'Ho va Ten' from tblSinhVien;
select sv_Maso,sv_Hodem,sv_Ten,sv_Ngaysinh from tblSinhvien;

select * from tblLop;
select * from tblKhoa;
select tblSinhVien.sv_HoDem, tblSinhVien.sv_Ten, tblSinhVien.sv_DiemTB, tblLop.l_Ten, tblKhoa.k_Ten from ((tblSinhVien
inner join tblLop on tblSinhVien.sv_Lop = tblLop.l_ID)
inner join tblKhoa on tblLop.l_Khoa = tblKHoa.k_ID)
where tblKhoa.k_Ten = 'CNTT';