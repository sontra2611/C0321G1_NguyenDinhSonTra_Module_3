create table class(
id int not null unique,
name varchar(45) not null,
primary key(id)
);

create table teacher(
id int not null unique,
name varchar(45) not null,
age int,
country varchar(45),
primary key(id)
);

