create database QuanLySanPham;
use QuanLySanPham;

create table SanPham(
sp_id int primary key,
tensp nvarchar(50),
gia double,
madein nvarchar(50),
foreign key (sp_id) references hdchitiet(hdct_id)
);

create table HoaDon(
hd_id int primary key,
ngay date,
tongGia double,
KhachHang nvarchar(50),
foreign key (hd_id) references hdchitiet(hdct_id)
);

ALTER TABLE hoadon
MODIFY COLUMN khachhang int;

create table HDChiTiet(
id_sp int not null,
id_hd int not null,
soluong int,
hdct_id int primary key ,
foreign key (hdct_id) references KhachHang(kh_id)
);

create table KhachHang(
kh_id int primary key,
hoTen nvarchar(50),
diachi nvarchar(50)
);

-- C6
select * from hoadon where ngay between '2006-06-19' and '2006-06-20';

-- C7
select hd_id, ngay, tonggia from hoadon where ngay between '2006-06-01' and '2006-06-30'
order by ngay , tongGia desc;

-- C8
select kh_id,hoten,ngay from khachhang inner join hoadon 
on khachhang.kh_id = hoadon.khachhang
where ngay = '2006-06-19';

-- C10
select sp_id,tensp from sanpham inner join hdchitiet on sanpham.sp_id = hdchitiet.id_sp
inner join hoadon on hdchitiet.id_hd = hoadon.hd_id
inner join khachhang on hoadon.khachhang = khachhang.kh_id
where (khachhang.hoTen like '%Nguyễn Hoài Nam%') and (ngay between '2006-06-01' and '2006-06-30');

-- C11
select hd_id, ngay,tensp from hoadon inner join hdchitiet on hoadon.hd_id = hdchitiet.id_hd
inner join sanpham on hdchitiet.id_sp = sanpham.sp_id
where tensp like '%OMO%' or '%COMFO%';

-- C12
select hd_id from hoadon
inner join hdchitiet on hoadon.hd_id = hdchitiet.id_hd
inner join sanpham on hdchitiet.id_sp = sanpham.sp_id
where (tensp like  '%OMO%' or '%COMFO%') and
 (hdchitiet.soluong between 10 and 20);

-- C13
select hd_id from hoadon 
inner join hdchitiet on hoadon.hd_id = hdchitiet.id_hd
inner join sanpham on hdchitiet.id_sp = sanpham.sp_id
where (tensp like  '%OMO%' and '%COMFO%') and (soluong between 10 and 20);
-- C15
select sp_id, tensp from sanpham inner join hdchitiet on sanpham.sp_id = hdchitiet.id_sp
inner join hoadon on hdchitiet.id_hd = hoadon.hd_id
where soluong = 0;

-- C16
select sp_id, tensp from sanpham inner join hdchitiet on sanpham.sp_id = hdchitiet.id_sp
inner join hoadon on hdchitiet.id_hd = hoadon.hd_id
where (soluong = 0 )
and (ngay like '%2006-%');


