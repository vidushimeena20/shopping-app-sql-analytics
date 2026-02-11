CREATE INDEX idx_customer ON orders(customer_id);
CREATE INDEX idx_product ON order_items(product_id);
CREATE INDEX idx_payment_date ON payments(payment_date);
