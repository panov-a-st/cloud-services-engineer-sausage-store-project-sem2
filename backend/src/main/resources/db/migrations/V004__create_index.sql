--  Создадим индексы
CREATE INDEX idx_order_product_order_id ON order_product(order_id);
CREATE INDEX idx_orders_status_date_created ON orders(status, date_created);
