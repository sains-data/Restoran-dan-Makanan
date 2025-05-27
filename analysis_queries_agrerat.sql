-- Membuat table utk 'pesanan' (orders)
CREATE TABLE pesanan (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_time TIME,
    total_price DECIMAL(10, 2)
);

-- Membuat tabel utk 'detail_pesanan' (order details)
CREATE TABLE detail_pesanan (
    order_id INT,
    pizza_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, pizza_id),
    FOREIGN KEY (order_id) REFERENCES pesanan(order_id)
);

-- Membuat tablel utk 'produk' (products/pizzas)
CREATE TABLE produk (
    pizza_id INT PRIMARY KEY,
    pizza_name_id VARCHAR(50),
    pizza_size CHAR(12),
    pizza_category VARCHAR(50),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100),
    unit_price DECIMAL(10, 2)
);

-- Import data ke tabel 'pesanan'
COPY pesanan (order_id, order_date, order_time, total_price)
FROM 'D:/Kuliah/S8/DW/TUEBS/proyek_data_warehouse/pesanan.csv'
DELIMITER ','
CSV HEADER;

-- Import data ke tabel 'detail_pesanan'
COPY detail_pesanan (order_id, pizza_id, quantity, unit_price, total_price)
FROM 'D:/Kuliah/S8/DW/TUEBS/proyek_data_warehouse/detail_pesanan.csv'
DELIMITER ','
CSV HEADER;

-- Import data ke tabel 'produk'
COPY produk (pizza_id, pizza_name_id, pizza_size, pizza_category, pizza_ingredients, pizza_name, unit_price)
FROM 'D:/Kuliah/S8/DW/TUEBS/proyek_data_warehouse/produk.csv'
DELIMITER ','
CSV HEADER;

-- Total Penjualan per Bulan
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_price) AS monthly_sales
FROM pesanan
GROUP BY month
ORDER BY month;

-- Rata-rata Transaksi per Order
SELECT 
    AVG(total_price) AS average_order_value
FROM pesanan;

-- Produk Terlaris Berdasarkan Kategori
SELECT 
    p.pizza_category, 
    p.pizza_name,
    SUM(dp.total_price) AS total_sales_per_product
FROM detail_pesanan dp
JOIN produk p ON dp.pizza_id = p.pizza_id
GROUP BY p.pizza_category, p.pizza_name
ORDER BY total_sales_per_product DESC;

-- OLAP Query untuk Analisis Multidimensional
SELECT 
    p.pizza_category,
    COUNT(dp.order_id) AS total_orders,
    AVG(dp.total_price) AS average_order_value,
    SUM(dp.total_price) AS total_sales
FROM detail_pesanan dp
JOIN produk p ON dp.pizza_id = p.pizza_id
GROUP BY p.pizza_category
ORDER BY total_sales DESC;

-- Produk Terlaris Berdasarkan Ukuran
SELECT 
    p.pizza_size,
    SUM(dp.total_price) AS total_sales_per_size
FROM detail_pesanan dp
JOIN produk p ON dp.pizza_id = p.pizza_id
GROUP BY p.pizza_size
ORDER BY total_sales_per_size DESC;
