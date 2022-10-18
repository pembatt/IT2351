-- Created by Pemba Tamang
-- This query creates a trigger that activates before the product table is activated.
-- It informs the user weather if the item is below $200 or above $1100.

Use pemba_tamang_shop;

DROP TRIGGER IF EXISTS products_before_update;

DELIMITER //

CREATE TRIGGER products_before_update
Before Update On products
FOR EACH ROW 

  BEGIN
  -- Alternate method
  --  DECLARE list_price_amount DECIMAL(9,2);
  
--  SELECT SUM(list_price) 
-- INTO list_price_amount
 -- FROM products
 -- WHERE product_id = NEW.product_id;
  
  
  
  
  Set New.list_price = count(New.list_price) ;
 
  IF New.list_price > 1100 THEN
    Select 'The item is above $1100' ;
    Elseif New.list_price < 200 Then
      Select 'The item is below $200.';
   End if;   
  
End//
  
  Delimiter ;
  
  Update products 
  Set product_name = try
  Where product_id = 1;