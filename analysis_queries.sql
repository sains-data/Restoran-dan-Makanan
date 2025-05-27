-- Update nilai NULL pada order_date
UPDATE pesanan
SET order_date = '2015-01-01'
WHERE order_date IS NULL OR order_date = '0000-00-00' OR order_date = '';

SELECT order_id, order_date, order_time, total_price
FROM pesanan
LIMIT 10;
