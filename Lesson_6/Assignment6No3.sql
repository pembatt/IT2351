Use pemba_tamang_shop;
Drop procedure if exists new_price;

Delimiter //

Create Function new_price
(
item_id_param 	int 

)

Returns decimal (9,2)
deterministic reads sql data

Begin 
	Declare new_price_var 	Decimal (9,2);
    Select item_price - discount_amount 
    Into new_price_var
    From order_items
    Where item_id = item_id_param ;
    
    Return (new_price_var);
    
    
End//
    
    Call new_price;
