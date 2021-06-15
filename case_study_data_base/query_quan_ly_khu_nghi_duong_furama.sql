use quan_ly_khu_nghi_duong_furama;

-- task 2 : Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.--
select * 
from nhan_vien
where (substring_index(ho_ten," ", -1) like "H%" or substring_index(ho_ten," ", -1) like "T%"  or substring_index(ho_ten," ", -1) like "K%" ) and character_length(ho_ten) <=15;

-- task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.--
select * 
from khach_hang
where ((year(now()) - year(ngay_sinh)) between 18 and 50) and dia_chi = "Đà Nẵng" or dia_chi = "Quảng Trị";

-- task 4 : 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.id_khach_hang, id_loai_khach, ho_va_ten, count(hop_dong.id_khach_hang) as so_lan_dat_phong
from khach_hang 
inner join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
where id_loai_khach = 1
group by khach_hang.id_khach_hang
order by so_lan_dat_phong;

-- task 5 : 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).--
select khach_hang.id_khach_hang, ho_va_ten, ten_loai_khach, hop_dong.id_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, (chi_phi_thue + so_luong*dich_vu_di_kem.gia) as tong_tien
from khach_hang
left join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
left join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
left join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem;

-- task 6: Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select id_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
from dich_vu
inner join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
where id_dich_vu not in (select id_dich_vu from hop_dong where ngay_lam_hop_dong >= '2019-01-01' and ngay_lam_hop_dong <= '2019-03-31');

-- task 7: Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.--
select id_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from dich_vu
inner join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
where id_dich_vu in (select id_dich_vu from hop_dong where year(ngay_lam_hop_dong) = 2018)

