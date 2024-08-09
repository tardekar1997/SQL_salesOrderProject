create table Branch_mst(
	Branch_cd char(4) primary key,
	Branch_name varchar(25) not null	 
)
go

create table Mktg_territory_mst(
	Area_cd char(4) primary key,
	Area_name varchar(25) not null
	,Branch_cd char(4) not null 
)
go

create table Mktg_rep_mst(
	Rep_cd char(4) primary key,
	Rep_name varchar(25) not null,
	Area_cd char(4) not null 
)
go

create table  Customer_mst(
	Cust_cd char(4) primary key,
	Cust_name varchar(25) not null
)
go

create table Product_mst(
	Prod_cd char(4) primary key,
	Prod_name varchar(25) not null ,
	Qty_on_hand bigint not null,
	Reorder_level bigint not null,
	Maximum_level bigint not null,
	Booked_qty bigint not null
)
go

create table Order_mst (
	Branch_cd char(4),
	Order_no bigint ,
	Order_dt date not null,
	Cust_cd char(4) not null,
	Rep_cd char(4) not null,
	Order_status char(1) not null,
	Valid_upto date not null,
	remarks varchar(200)
)
go

create table Order_dtl(
	Branch_cd char(4),
	Order_no bigint,
	Prod_cd char(4) not null,
	Qty int not null,
	rate decimal(6,2) not null
)

