alter table Mktg_territory_mst 
add constraint chk_valid_branch_cd check (len(branch_cd)<5)
go

alter table Mktg_rep_mst 
add constraint chk_valid_Areacd check (len(area_cd)<5)
go

alter table product_mst
add constraint chk_noNegativeQty check (Booked_qty>=0)
go

alter table order_mst 
alter column order_no bigint not null

alter table order_mst 
alter column branch_cd char(4) not null


alter table order_mst 
add 
	constraint pk_composite_ordMst 
	primary key (branch_cd,order_no),

	constraint chk_ordStatusValues 
	check (order_status in ('cancelled', 'delivered', 'pending')),

	constraint def_ordStatus 
	default 'P' FOR order_status,

	constraint chk_valid_date 
	check (datediff(day,valid_upto,order_dt) > 7)
go

alter table order_dtl
alter column branch_cd char(4) not null

alter table order_dtl
alter column order_no bigint not null
go

alter table order_dtl
add
	constraint pk_composite_ordDtl
	primary key (branch_cd, order_no, prod_cd),

	constraint chk_qtyNegetive 
	check (qty >=0 and rate> = 0)

go
