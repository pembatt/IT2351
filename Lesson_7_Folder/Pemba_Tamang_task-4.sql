-- Edited by P


-- Uses the ap database
USE ap;

-- Drops the trigger invoices_before_update if it exists. 
DROP TRIGGER IF EXISTS invoices_before_update;

-- Replaces the ; default delimeter with //.
DELIMITER //

-- Creates a trigger invoices_before_update that activates for each row before values are updated in the invoice table. 
CREATE TRIGGER invoices_before_update
  BEFORE UPDATE ON invoices
  FOR EACH ROW
  
BEGIN
-- Creates a variable um_line_item_amount that will hold a decimal value. 
  DECLARE sum_line_item_amount DECIMAL(9,2);
  
  -- Takes the sum of the new value added in the column line_item_amount and puts it into the variable sum_line_item_amount from the 
  -- invoice_line_items table.
  SELECT SUM(line_item_amount) 
  INTO sum_line_item_amount
  FROM invoice_line_items
  WHERE invoice_id = NEW.invoice_id;
  
  -- Creates a if statement that activates when the variable is not equal to invoice_total. This statement is to validate if the 
  -- two amounts match.
  
  IF sum_line_item_amount != NEW.invoice_total THEN
  -- If the above condition is true, it will signal a error message 'Line item total must match invoice total.'
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Line item total must match invoice total.';
      -- Ends if statement.
  END IF;
  
END//

-- Sets the delimiter back to the default ;.
DELIMITER ;

-- Adds a value to the invoice table
UPDATE invoices
-- Updates the invoice total of invoice_id 100 to 600.
SET invoice_total = 600
WHERE invoice_id = 100;

-- Shows the values of invoice_id, invoice_total, credit_total, payment_total where the invoice_id di 100 from the invoice table. 
SELECT invoice_id, invoice_total, credit_total, payment_total 
FROM invoices WHERE invoice_id = 100;
