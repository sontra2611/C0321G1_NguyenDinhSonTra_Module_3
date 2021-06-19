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
where id_dich_vu in (select id_dich_vu from hop_dong where year(ngay_lam_hop_dong) = 2018) and id_dich_vu not in (select id_dich_vu from hop_dong where year(ngay_lam_hop_dong) = 2019);

-- task 8 : Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.--
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên--
-- Cách 1--
select distinct ho_va_ten
from khach_hang;

-- Cách 2--
select ho_va_ten
from khach_hang
group by ho_va_ten;

-- cách 3--
select ho_va_ten
from khach_hang
union
select ho_va_ten
from khach_hang; 

-- task 9 : Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang, count(id_hop_dong) as so_khach_hang_dat_phong
from hop_dong 
where year(ngay_lam_hop_dong) = 2019
group by month(ngay_lam_hop_dong);

-- task 10 : Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
select hop_dong.id_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, count(id_hop_dong_chi_tiet) as so_luong_dich_vu_di_kem
from hop_dong
inner join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
group by id_hop_dong;

-- task 11 : Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.--
select dich_vu_di_kem.id_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung 
from dich_vu_di_kem
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
inner join hop_dong on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
inner join khach_hang on hop_dong.id_khach_hang = khach_hang.id_khach_hang
where id_loai_khach = 1 and ( dia_chi = "Vinh" or dia_chi = "Quảng Ngãi")
group by dich_vu_di_kem.id_dich_vu_di_kem;

-- task 12 : 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.--
select hop_dong.id_hop_dong, nhan_vien.ho_ten, khach_hang.ho_va_ten, khach_hang.sdt, ten_dich_vu, count(id_hop_dong_chi_tiet) as so_luong_dich_vu_di_kem, tien_dat_coc
from hop_dong 
inner join nhan_vien on hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien
inner join khach_hang on hop_dong.id_khach_hang = khach_hang.id_khach_hang 
inner join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu 
inner join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
where hop_dong.id_dich_vu in (select hop_dong.id_dich_vu from hop_dong where (month(ngay_lam_hop_dong) between 10 and 12) and year(ngay_lam_hop_dong) = 2019) 
and hop_dong.id_dich_vu not in (select hop_dong.id_dich_vu from hop_dong where (month(ngay_lam_hop_dong) between 1 and 6) and year(ngay_lam_hop_dong) = 2019)
group by hop_dong.id_hop_dong;

-- task 13 : Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).--
select dich_vu_di_kem.id_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung, count(hop_dong_chi_tiet.id_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem
inner join hop_dong_chi_tiet on dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
group by id_dich_vu_di_kem
having so_lan_su_dung >= all (select count(id_dich_vu_di_kem) from hop_dong_chi_tiet group by id_dich_vu_di_kem);

-- task 14 : Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
select hop_dong_chi_tiet.id_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(hop_dong_chi_tiet.id_dich_vu_di_kem) as so_lan_su_dung
from hop_dong_chi_tiet
inner join hop_dong on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
inner join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
inner join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
inner join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
group by ten_dich_vu_di_kem
having so_lan_su_dung = 1;

-- task 15 : Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
select nhan_vien.id_nhan_vien, ho_ten, trinh_do, ten_bo_phan, sdt, dia_chi, count(hop_dong.id_nhan_vien) as so_hop_dong_lap_duoc
from nhan_vien
inner join hop_dong on nhan_vien.id_nhan_vien = hop_dong.id_nhan_vien
inner join trinh_do on nhan_vien.id_trinh_do = trinh_do.id_trinh_do
inner join bo_phan on nhan_vien.id_bo_phan = bo_phan.id_bo_phan
where (year(hop_dong.ngay_lam_hop_dong) = 2018 or year(hop_dong.ngay_lam_hop_dong) = 2019)
group by id_nhan_vien
having so_hop_dong_lap_duoc <= 3;

-- task 16 : Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
delete from nhan_vien
where id_nhan_vien not in (select id_nhan_vien
					   from hop_dong
					   where year(hop_dong.ngay_lam_hop_dong) <= 2021);
                        
-- task 17 : Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.--
create temporary table bang_tam(select khach_hang.id_khach_hang, sum(chi_phi_thue + so_luong*dich_vu_di_kem.gia) as tong_tien
						from khach_hang 
						join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
						join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
						join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
						join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
                        where year(ngay_lam_hop_dong) = 2019
                        group by id_khach_hang
                        having tong_tien > 10000000);
                        
update khach_hang
set id_loai_khach = 1
where id_loai_khach = 2
and id_khach_hang in (select id_khach_hang from bang_tam);

-- task 18 : Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).
create temporary table bang_tam_1 ( select khach_hang.id_khach_hang
						 from khach_hang
                         join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
                         where year(ngay_lam_hop_dong) < 2016
                         group by id_khach_hang );
                         
delete 
from khach_hang
where id_khach_hang in (select id_khach_hang from bang_tam_1);

-- task 19 : Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi--
create temporary table bang_tam_2(select id_dich_vu_di_kem, count(id_dich_vu_di_kem) as so_lan_su_dung
							from hop_dong_chi_tiet
                            group by id_dich_vu_di_kem
                            having so_lan_su_dung > 2);
update dich_vu_di_kem
set gia = gia * 10
where id_dich_vu_di_kem in (select id_dich_vu_di_kem from bang_tam_2);

-- task 20 : Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
select id_nhan_vien as id, ho_ten, email, sdt, ngay_sinh, dia_chi
from nhan_vien
union all
select id_khach_hang as id, ho_va_ten, email, sdt, ngay_sinh, dia_chi
from khach_hang;

-- task 21 : Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019”
create view v_nhan_vien as
select nhan_vien.* from nhan_vien 
inner join hop_dong on nhan_vien.id_nhan_vien = hop_dong.id_nhan_vien
where hop_dong.ngay_lam_hop_dong = '2019-12-12' and nhan_vien.dia_chi = "Hải Châu";

-- task 22 : Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này.
update v_nhan_vien
set dia_chi = 'Liên Chiểu';

-- task 23 : Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng.
create unique index IX_KHACHHANG 
on khach_hang(id_khach_hang);

explain select * 
from khach_hang 
where id_khach_hang = 1;

-- task 24 : Tạo Non-Clustered Index có tên là IX_SoDT_DiaChi trên các cột SODIENTHOAI và DIACHI trên bảng KHACH HANG và kiểm tra tính hiệu quả tìm kiếm sau khi tạo Index.
create index IX_SDT_DiaChi 
on khach_hang(sdt, dia_chi);

explain 
select * 
from khach_hang 
where sdt = 0905261197 or sdt = 0905201090;

-- task 25 : Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó với Id Khách hàng được truyền vào như là 1 tham số của Sp_1
delimiter //
create procedure sp_1 (in input_id int)
begin
	delete from khach_hang
    where id_khach_hang = input_id;
end //
delimiter ;
call sp_1(8);

-- task 26 : Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_2 (in in_id_hop_dong int, in in_id_nhan_vien int, in in_id_khach_hang int, in in_id_dich_vu int, in in_ngay_lam_hop_dong date, in in_ngay_ket_thuc date, in in_tien_dat_coc double)
begin 
	if in_id_hop_dong not in (select id_hop_dong from hop_dong)
		and in_id_nhan_vien in (select id_nhan_vien from nhan_vien)
        and in_id_khach_hang in (select id_khach_hang from khach_hang)
        and in_id_dich_vu in (select id_dich_vu from dich_vu)
		then 
			insert into hop_dong
			values (in_id_hop_dong, in_id_nhan_vien, in_id_khach_hang, in_id_dich_vu, in_ngay_lam_hop_dong, in_ngay_ket_thuc, in_tien_dat_coc);
	else
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Thêm không thành công";
        end if;
end //
delimiter ;
call sp_2(10,1,1,1, '2017-10-10', '2018-10-10', 5000000);

-- task 27 : Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database
delimiter //
create trigger tr_1
after delete
on hop_dong for each row
begin
set @so_luong_hop_dong = (select count(id_hop_dong) from hop_dong );
end //
delimiter ;

set @so_luong_hop_dong = 0;
delete from hop_dong
where id_hop_dong = 10;

select @so_luong_hop_dong as 'so_luong_hop_dong';
-- task 28 : Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database
delimiter //
create trigger tr_2
before update on hop_dong
for each row
begin
if datediff(new.ngay_ket_thuc,old.ngay_lam_hop_dong) < 2 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "ngày kết thúc phải sau ngày làm hợp đồng ít nhất là 2 ngày";
end if;
end //
delimiter ;

update hop_dong set ngay_ket_thuc = '2021-03-10' where id_hop_dong = 5;

-- task 29 : Tạo user function thực hiện yêu cầu sau: --
-- a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.--
delimiter //
create function func_1 ()
returns int
deterministic
begin
declare count int;
	create temporary table bang_tam(select dich_vu.id_dich_vu, sum(chi_phi_thue + so_luong * dich_vu_di_kem.gia) as tong_tien
						from dich_vu 
						join hop_dong on dich_vu.id_dich_vu = hop_dong.id_dich_vu
						join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
						join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
                        group by id_dich_vu
                        having tong_tien > 2000000);  
	set count = (select count(id_dich_vu) from bang_tam);
    return count ;
end; //
delimiter ;

select quan_ly_khu_nghi_duong_furama.func_1() as "so_luong_dich_vu";

-- b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của Khách hàng được truyền vào như là 1 tham số của function này --
delimiter //
create function func_2(input_id_khach_hang int)
returns int
deterministic
begin
declare thoi_gian int;
set thoi_gian = ( select max(datediff(ngay_ket_thuc,ngay_lam_hop_dong)) from hop_dong where id_khach_hang = input_id_khach_hang );
return thoi_gian;
end; //
delimiter ;

select quan_ly_khu_nghi_duong_furama.func_2(2) as "max_thoi_gian_hop_dong";

-- task 30 : Tạo Stored procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu) và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng HopDong) và những bản liên quan khác.
delimiter //
create procedure sp_3()
begin
create temporary table bang_tam(select dich_vu.id_dich_vu, hop_dong.id_hop_dong, hop_dong_chi_tiet.id_hop_dong_chi_tiet 
from dich_vu 
inner join hop_dong on dich_vu.id_dich_vu = hop_dong.id_dich_vu
inner join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
where id_loai_dich_vu = 3 and (year(ngay_lam_hop_dong) between 2015 and 2019));

delete from hop_dong_chi_tiet where id_hop_dong in (select id_hop_dong from hop_dong where id_dich_vu in (select id_dich_vu from bang_tam));
delete from hop_dong where id_dich_vu in (select id_dich_vu from bang_tam);
delete from dich_vu where id_dich_vu in (select id_dich_vu from bang_tam);
end //
delimiter ;

call sp_3;

