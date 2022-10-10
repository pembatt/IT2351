-- This query creates a procedure to add values to the general ledger account. 
-- Created by Pemba Tamang, 10/9/22

Drop Procedure If exists insert_glaccount;

Delimiter //

Create Procedure insert_glaccount
(
	 account_number_param    INT,
	 account_description_param  Varchar(60)
)

Begin
	Insert into general_ledger_accounts Values (account_number_param , account_description_param )
   
End ;

Delimiter ;

Call insert_glaccount(5 ,2);


	