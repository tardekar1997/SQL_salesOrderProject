create trigger trg_update_qty_productMst 
on product_mst 
after update
as
begin
	
	if update(booked_qty)
		begin
			update Product_mst set Qty_on_hand= i.Qty_on_hand-i.Booked_qty
			from Product_mst p 
			join inserted i on i.Prod_cd=p.Prod_cd
			join deleted d on d.Prod_cd= p.Prod_cd
		end

end