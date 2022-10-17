To delete a customer. Use a stored procedure to set a template to easily delete
any customer with simply the customer_id. 

 - Create a procedure using the create procedure command.
- Create a method to pass parameters.
- Use the Delete From command to select the table
 - Connect the method to the customer_id
- Delete any row by calling the method and passing a parameter to the procedure.


Use pemba_tamang_shop;

Drop Procedure if exists delete_customer ;

Delimiter //

Create Procedure delete_customer
(
customer_id_param  int 
)
Begin
Delete From customers
Where customer_id =customer_id_param;
End//

Call delete_customer(1)

 

