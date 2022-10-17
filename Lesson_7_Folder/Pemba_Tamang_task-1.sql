-- Edited by Pemba Tamang on 10/16/22
-- Uses the ap database and drops the procedure test if it exists.
USE ap;

DROP PROCEDURE IF EXISTS test;

-- Replaces the ; default delimeter to //.
DELIMITER //

-- Creates a procedure called test.
CREATE PROCEDURE test()

BEGIN
-- Creates variable sql_error that is by default false.

  DECLARE sql_error INT DEFAULT FALSE;
  
-- Sets a handler for SQL exceptions, if a exception is encountered the value of the variable sql_error is flipped to true.
-- If no exception is encountered then, line 20 and 21 will have no effect.

  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

-- Creates a transaction
  START TRANSACTION;
  
  -- The values within the parenthesis will be inserted into the tables mentioned above them. 
  INSERT INTO invoices
  VALUES (115, 34, 'ZXA-080', '2014-06-30', 
          14092.59, 0, 0, 3, '2014-09-30', NULL);

  INSERT INTO invoice_line_items 
  VALUES (115, 1, 160, 4447.23, 'HW upgrade');
  
  INSERT INTO invoice_line_items 
  VALUES (115, 2, 167, 9645.36, 'OS upgrade');
  
  -- If the value of the variable sql_error is false, meaning no exception were encountered ,
  -- then the values inserted by the code aboce will be commited into the database. 
  IF sql_error = FALSE THEN
    COMMIT;
    SELECT 'The transaction was committed.';
    
    -- If the variable sql_error is true , meaning atleast one exception was encountered ,
  -- then the values inserted by the code will be rollbacked, meaning the values will not be entered. 
  ELSE
    ROLLBACK;
    SELECT 'The transaction was rolled back.';
  END IF;
END//

-- Sets the delimeter back to the default ;.
DELIMITER ;

-- Calls the procedure test, that was just created. 
CALL test();

-- Check data
-- Shows the fields invoice_id and invoice number where the invoice id is 115. 
SELECT invoice_id, invoice_number
FROM invoices WHERE invoice_id = 115;

-- Shows the fields invoice_id, invoice_sequence, line_item_description where the invoice id is 115. 
SELECT invoice_id, invoice_sequence, line_item_description
FROM invoice_line_items WHERE invoice_id = 115;

-- Clean up
-- Deletes values from invoice_line_items and invoices tables, where invoice_id is 115.
DELETE FROM invoice_line_items WHERE invoice_id = 115;
DELETE FROM invoices WHERE invoice_id = 115;