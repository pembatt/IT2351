Use ap;
Drop Procedure If exists test;

Delimiter //

Create Procedure test()
Begin
	Declare total_count Int;
    
    Select count(invoice_total > 6000) as invoice_count
    Into total_count
    From invoices;
    

		If total_count < 0 Then
			Select 'No count' as message;
		Else
			Select  concat( total_count , '  invoices exceed 3000') as Message;
            
		End if;
End //
    
    Delimiter ;
    
    Call test();