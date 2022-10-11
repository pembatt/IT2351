-- This Query creates and calls a stored procedure that counts the total number of prodcuts, and determines weather they are above oer below 18.
-- Created by Pemba Tamang 10/10/22

Use pemba_tamang_shop;
Drop procedure if exists ProductCount;

Delimiter //

Create procedure ProductCount()

Begin
-- Declare an integer variable to hold the output of the count.
	declare product_count_var int;
    Select count(*)
-- Assign the count aggregate to the variable.
    Into product_count_var
    From products;
    
    -- Shows either output based on a condition.
    If product_count_var >= 18
		Then Select 'The number of products is greater than or equal to 18.' as Message;
	Else 
		Select 'The number of products is less than 18.' as Message ;
	
    End If ;
    
End //

Call ProductCount;
    
