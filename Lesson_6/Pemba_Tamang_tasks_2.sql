Delimiter //

Drop Procedure If exists test;
Create Procedure test()
Begin
	Declare duplicate_entry_for_key Tinyint Default False;
    Declare Continue Handler for 1062
		Set duplicate_entry_for_key = True;
        
	Insert Into general_ledger_accounts Values (130, 'Cash');
    
    If duplicate_entry_for_key = True Then
		Select 'Row was not inserted - duplicate key enountered.' as message;
        
	Else
		Select '1 row was inserted.' as message;
        
	End if;
End//

Call test()
    
    
    
