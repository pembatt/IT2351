-- items_ordered that shows the product name, item price and quantity for each item ordered

CREATE VIEW items_ordered AS
SELECT  product_name, item_price, quantity
FROM order_items  
join products on products.product_id=order_items.product_id;