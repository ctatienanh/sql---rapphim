create database ticketfilm;
use ticketfilm;

create table phong(
idphong int primary key auto_increment,
namephong varchar(250),
status varchar(250)
);

create table ghe(
idghe int primary key auto_increment,
idphong int,
soghe int,
foreign key (idphong) references phong(idphong)
);

create table phim(
idphim int primary key auto_increment,
namephim varchar(250),
loaiphim varchar(250),
thoigian date
);

create table ve(
idphim int,
idghe int,
ngaychieu date,
statuss varchar(250),
primary key ( idphim,idghe),
foreign key (idphim) references phim(idphim),
foreign key (idghe) references ghe(idghe)
);

-- cau2
select namephim , thoigian from phim
order by thoigian;

-- cau 3
select namephim, thoigian as 'thoi gian' from phim where thoigian = (select max(thoigian) from phim) ;

-- cau 4

select namephim, thoigian as 'thời gian' from phim
where thoigian = (select min(thoigian) from phim);

-- cau5
select soghe from ghe where soghe like('a%');

-- cau6
alter table phong modify status nvarchar(250);

-- cau 7
update phong set status = if(status = '0', 'đang sửa', if(status='1' , 'Đang sử dụng', if(status= null , 'Unknow','Unknow'))) where idphong >0;

-- cau 8
select namephim from phim where length(namephim) between 16 and 24;

-- cau 9
select concat(status, namephong)  as 'trang thái phòng' from phong;

-- cau10
create table tblrank(
select namephim,thoigian from phim
);

-- cau11

