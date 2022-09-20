-- This query shows the number of orders for each product organized by it's category name and the product name.
-- Created by Pemba Tamang, 9/19/22

Select if (grouping(category_name) ,"Grand Total", category_name) AS Category , 
if(grouping(product_name) , "Category Total", product_name) AS Product , 
sum(quantity) As Orders
 From categories
Join products On categories.category_id = products.category_id
Join order_items On products.product_id = order_items.product_id
Group by category_name , product_name  With Rollup

