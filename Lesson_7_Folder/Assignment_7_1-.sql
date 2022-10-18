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

 
