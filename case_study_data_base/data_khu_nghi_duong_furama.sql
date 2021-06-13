use quan_ly_khu_nghi_duong_furama;

insert into vi_tri(id_vi_tri, ten_vi_tri)
values
(1,'Giám đốc'),
(2,'Phó giám đốc'),
(3,'Quản Lý'),
(4,'Trưởng Phòng'),
(5,'Trưởng Nhóm'),
(6,'Nhân viên');

insert into trinh_do(id_trinh_do, trinh_do)
values
(1,'Đại học'),
(2,'Cao đẳng'),
(3,'Trung cấp'),
(4,'Khác');

insert into bo_phan(id_bo_phan, ten_bo_phan)
values
(1,'Lễ Tân'),
(2,'Buồng Phòng'),
(3,'Ẩm thực'),
(4,'Kinh doanh'),
(5,'Hành chính - Nhân sự'),
(6,'Tài Chính - Kế Toán'),
(7,'Kỹ Thuật'),
(8,'An ninh');

insert into nhan_vien(id_nhan_vien, ho_ten, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, sdt, email, dia_chi)
values
(1,'Nguyễn Văn An',  1, 1, 4, '1990-01-15', 111453211, 30000000, 0905150190, 'nguyenan@gmail.com','Đà Nẵng'),
(2,'Nguyễn Văn Bình', 6, 2, 7, '1993-02-22', 112123456, 6000000, 0905220293, 'nguyenbinh@gmail.com','Quảng Nam'),
(3,'Hồ Thị Hoa', 3, 1, 3, '1995-11-04', 113980765, 10000000, 0935041194, 'hoaho@gmail.com','Huế'),
(4,'Trần Văn Đạt', 4, 1, 6, '1992-09-26', 114123165, 8000000, 0770260992, 'trandat@gmail.com','Nghệ An'),
(5,'Lê Thị Huyền', 5, 2, 2, '1996-05-05', 115742178, 6000000, 0905050596, 'huyenle@gmail.com','Quảng Trị'),
(6,'Phạm Thị Phương', 6, 3, 1, '1994-12-19', 116414141, 5000000, 0905191294, 'phuongpham@gmail.com','Quảnh Bình'),
(7,'Khương Văn Duy', 6, 3, 8, '1991-09-02', 117776527, 5000000, 0905020991, 'Khuongduy@gmail.com','Nha Trang'),
(8,'Huỳnh Thị Cẩm Tú', 2, 1, 5, '1997-12-10', 118453211, 20000000, 0905101297, 'camtu@gmail.com','Thanh Hoá');

delete from nhan_vien;
select * from nhan_vien;



