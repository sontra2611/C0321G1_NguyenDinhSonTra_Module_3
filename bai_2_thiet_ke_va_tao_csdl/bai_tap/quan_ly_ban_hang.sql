create database QuanLyBanHang;

use QuanLyBanHang;

create table Customer(
	cID varchar(255) primary key,
    cName varchar(255),
    cAge int
);

create table Orderr(
	oID varchar(255) primary key,
    cID varchar(255) not null unique,
    oDate datetime,
    oTotalPrice double,
    foreign key(cID) references Customer(cID)
);

create table Product(
	pID varchar(255) primary key,
    pName varchar(255),
    pPrice double
);

create table OrderDetail(
	oID varchar(255),
    pID varchar(255),
    odQTY varchar(255),
    primary key(oID,pID),
    foreign key (oID) references Orderr(oID),
	foreign key (pID) references Product(pID)
);    


    


    
    
    
    
