alter table mktg_territory_mst 
add constraint fk_Branch_cd_ref_branchMst 
	foreign key (branch_cd)
	references branch_mst(branch_cd)

go

alter table mktg_rep_mst
add constraint fk_area_code_ref_mktg_territory_mst
foreign key (Area_cd)
references mktg_territory_mst(Area_cd)

go

alter table order_mst
add 
constraint fk_branch_cd_ref_BranchMst
foreign key (branch_cd) 
references branch_mst(branch_cd),

constraint fk_cust_cd_ref_cust_mst 
foreign key (cust_cd)
references customer_mst(cust_cd),

constraint fk_rep_cd_ref_mktg_rep_mst
foreign key (rep_cd)
references mktg_rep_mst(rep_cd)
go

alter table order_dtl
add constraint fk_branch_cd_ref_branchMst
foreign key (branch_cd)
references branch_mst(branch_cd),

constraint fk_prod_cd_ref_productMst
foreign key (prod_cd)
references product_mst(prod_cd)
