create database database_furama;

use database_furama;


-- vị trí
create table position (
position_id int primary key auto_increment,
position_name varchar(45)
);

insert into position (position_name)
values
('Giám đốc'),
('Phó giám đốc'),
('Quản Lý'),
('Trưởng Phòng'),
('Trưởng Nhóm'),
('Nhân viên');

-- trình độ
create table education_degree (
education_degree_id int primary key auto_increment,
education_degree_name varchar(45)
);

insert into education_degree (education_degree_name)
values
('Đại học'),
('Cao đẳng'),
('Trung cấp'),
('Khác');

-- bộ phận
create table division ( 
division_id int primary key auto_increment,
division_name varchar(45)
);

insert into division (division_name)
values
('Lễ Tân'),
('Buồng Phòng'),
('Ẩm thực'),
('Kinh doanh'),
('Hành chính - Nhân sự'),
('Tài Chính - Kế Toán'),
('Kỹ Thuật'),
('An ninh');

-- tài khoản
create table `user`(
username varchar(255) primary key,
`password` varchar(255)
);

insert into `user`
values
('nguyenan', '123123'),
('nguyenbinh', '123123'),
('hoaho', '123123'),
('trandat', '123123'),
('huyenle', '123123'),
('phuongpham', '123123'),
('khuongle', '123123'),
('camtu', '123123'),
('nguyenc', '123123');

-- nhân viên
create table employee (
employee_id int auto_increment primary key,
employee_name varchar(45) not null,
employee_birthday date not null,
employee_id_card varchar(45) not null,
employee_salary double not null,
employee_phone varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int not null,
education_degree_id int not null,
division_id int not null, 
username varchar(255),
foreign key (position_id) references position (position_id) on delete cascade on update cascade,
foreign key (education_degree_id) references education_degree(education_degree_id)  on delete cascade on update cascade,
foreign key (division_id) references division(division_id) on delete cascade on update cascade,
foreign key (username) references `user` (username) on delete cascade on update cascade
);

insert into employee(employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id, username )
values 
('Nguyễn Văn An', '1990-01-15', 111453211, 30000000, 0905150190, 'nguyenan@gmail.com','Đà Nẵng', 1, 1, 4, 'nguyenan'),
('Nguyễn Văn Bình', '1993-02-22', 112123456, 6000000, 0905220293, 'nguyenbinh@gmail.com','Quảng Nam', 6, 2, 7, 'nguyenbinh'),
('Hồ Thị Hoa', '1995-11-04', 113980765, 10000000, 0935041194, 'hoaho@gmail.com','Huế', 3, 1, 3, 'hoaho'),
('Trần Văn Đạt', '1992-09-26', 114123165, 8000000, 0770260992, 'trandat@gmail.com','Nghệ An', 4, 1, 6, 'trandat'),
('Lê Thị Huyền', '1996-05-05', 115742178, 6000000, 0905050596, 'huyenle@gmail.com','Quảng Trị', 5, 2, 2, 'huyenle'),
('Phạm Thị Phương', '1994-12-19', 116414141, 5000000, 0905191294, 'phuongpham@gmail.com','Quảnh Bình', 6, 3, 1, 'phuongpham'),
('Lê Văn Khương', '1991-09-02', 117776527, 5000000, 0905020991, 'khuongle@gmail.com','Nha Trang', 6, 3, 8, 'khuongle'),
('Huỳnh Thị Cẩm Tú', '1997-12-10', 118453211, 20000000, 0905101297, 'camtu@gmail.com','Thanh Hoá',  2, 1, 5, 'camtu'),
('Nguyễn Văn C', '1997-12-10', 118453211, 20000000, 0905101297, 'nguyenc@gmail.com','Quảng Bình', 6, 3, 1, 'nguyenc');

create table `role` (
role_id int primary key auto_increment,
role_name varchar(255)
);

insert into `role` (role_name)
values 
('admin'),
('user');

create table user_role (
role_id int,
username varchar(255), 
foreign key(role_id) references `role`(role_id) on delete cascade on update cascade,
foreign key(username) references `user`(username) on delete cascade on update cascade
);

insert into user_role
values
(1, 'nguyenan'),
(2, 'nguyenbinh'),
(1, 'hoaho'),
(2, 'trandat'),
(2, 'huyenle'),
(2, 'phuongpham'),
(2, 'khuongle'),
(1, 'camtu'),
(2, 'nguyenc');

-- loại khách hàng
create table customer_type(
	customer_type_id int auto_increment primary key,
    customer_type_name varchar(45)
);

insert into customer_type (customer_type_name)
values
('Diamon'),
('platinum'),
('Gold'),
('Silver'),
('Member');

-- khách hàng
create table customer(
	customer_id int auto_increment primary key,
    customer_code varchar(45) not null unique,
    customer_type_id int not null ,
    customer_name varchar(45) not null ,
    customer_birthday date not null ,
	customer_gender bit,
    customer_id_card varchar(45) not null ,
    customer_phone varchar(45) not null,
    customer_email varchar(45),
    customer_address varchar(45),
    foreign key (customer_type_id) references customer_type(customer_type_id) on delete cascade on update cascade
);

insert into customer(customer_code ,customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address)
values
('KH-1001', 1, 'Nguyễn Đình Sơn Trà', '1997-11-26', 0, 100261197, 0905261197, 'tranguyen@gmail.com', 'Đà Nẵng'),
('KH-1002', 1, 'Trương Quốc Pháp', '1990-10-20', 0,100201090, 0905201090, 'phaptruong@gmail.com', 'Quảng Ngãi'),
('KH-1003', 2, 'Nguyễn Thị Nhung', '1995-08-30', 1, 100300895, 0905300895, 'nhungnguyen@gmail.com', 'Nghệ An'),
('KH-1004', 2, 'Nguyễn Thị Bích Thuý', '1996-02-28', 1, 100280296, 0905280296, 'thuynguyen@gmail.com', 'Quảng Trị'),
('KH-1005', 1, 'Nguyễn Thanh Bình', '1994-05-01', 0, 100010594, 0905010594, 'binhnguyen@gmail.com', 'Quảng Nam'),
('KH-1006', 5, 'Huỳnh Thị Bảo Trân', '1998-09-02', 1, 100020998, 0905020998, 'tranhuynh@gmail.com', 'Huế'),
('KH-1007', 2, 'Nguyễn Văn Lý Huỳnh', '1993-07-02', 0, 100020793, 0905020793, 'huynhnguyen@gmail.com', 'Vinh');

-- loại dịch vụ
CREATE TABLE service_type(
service_type_id int auto_increment primary key,
service_type_name varchar(45)
);

insert into service_type (service_type_name)
values
('villa'),
('house'),
('room');

-- kiểu thuê
create table rent_type(
rent_type_id int auto_increment primary key,
rent_type_name varchar(45),
rent_type_cost double
);

insert into rent_type (rent_type_name, rent_type_cost)
values
('năm', 50000000),
('tháng', 40000000),
('ngày', 30000000),
('giờ', 20000000);