-- This query creates and calls a procedure that adds a row in the category table adn includes error handling.
-- Created by Pemba Tamang 10/10/22

Use pemba_tamang_shop;
Drop procedure if exists InsertCategory;

Delimiter //

Create Procedure InsertCategory()

Begin
-- Creating a bool variable that deafaults to false.

Declare insert_error bool Default False;
-- Variable will flip if the code below encounters error 1062
Declare continue Handler for 1062
	Set insert_error = True;
    
	Insert into categories Values (5 ,'Wind');
    
    If insert_error = True Then
		Select ' Row was not inserted - duplicate entry' as Message;
    Else 
		Select '1 row was inserted' as Message;
        
	End if;
    
End//

Call InsertCategory;

