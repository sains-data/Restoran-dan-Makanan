-- ETL Process for Pizza Sales Data Warehouse
-- Extract, Transform, Load
-- =============================================

USE warehouse;

-- =============================================
-- EXTRACT PHASE
-- =============================================

-- Validasi data yang sudah di-load
SELECT 'EXTRACT PHASE - Data Validation' AS phase;

-- Cek jumlah record setelah extract
SELECT 'produk' AS table_name, COUNT(*) AS record_count FROM produk
UNION ALL
SELECT 'pesanan' AS table_name, COUNT(*) AS record_count FROM pesanan
UNION ALL
SELECT 'detail_pesanan' AS table_name, COUNT(*) AS record_count FROM detail_pesanan;

-- =============================================
-- TRANSFORM PHASE
-- =============================================

SELECT 'TRANSFORM PHASE - Data Cleaning & Transformation' AS phase;

-- 1. Clean order_date (handle NULL and invalid dates)
UPDATE pesanan
SET order_date = '1/1/2015'
WHERE order_date IS NULL OR order_date = '0000-00-00' OR order_date = '' OR order_date = 'NULL';

-- 2. Clean price data (handle NULL prices)
UPDATE produk 
SET unit_price = 0 
WHERE unit_price IS NULL;

UPDATE detail_pesanan 
SET unit_price = 0 
WHERE unit_price IS NULL;

-- 3. Recalculate total_price if inconsistent
UPDATE detail_pesanan 
SET total_price = quantity * unit_price 
WHERE total_price != (quantity * unit_price) OR total_price IS NULL;

-- 4. Clean pizza names (remove extra spaces)
UPDATE produk 
SET pizza_name = TRIM(pizza_name),
    pizza_category = TRIM(pizza_category),
    pizza_size = TRIM(pizza_size)
WHERE pizza_name IS NOT NULL;

-- 5. Standardize pizza_size format
UPDATE produk 
SET pizza_size = UPPER(pizza_size)
WHERE pizza_size IS NOT NULL;

-- 6. Handle duplicate records
DELETE p1 FROM produk p1
INNER JOIN produk p2 
WHERE p1.pizza_id > p2.pizza_id 
AND p1.pizza_name_id = p2.pizza_name_id;

-- =============================================
-- LOAD PHASE
-- =============================================

SELECT 'LOAD PHASE - Create Data Warehouse Structure' AS phase;

-- Create dimension tables for data warehouse
CREATE TABLE IF NOT EXISTS dim_pizza (
    dim_pizza_id INT PRIMARY KEY AUTO_INCREMENT,
    pizza_id INT,
    pizza_name_id VARCHAR(100),
    pizza_name VARCHAR(150),
    pizza_category VARCHAR(100),
    pizza_size VARCHAR(50),
    pizza_ingredients TEXT,
    ingredient_count INT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS dim_date (
    dim_date_id INT PRIMARY KEY,
    order_date DATE,
    year INT,
    quarter INT,
    month INT,
    day INT,
    day_of_week INT,
    day_name VARCHAR(10),
    month_name VARCHAR(10),
    is_weekend BOOLEAN
);

CREATE TABLE IF NOT EXISTS dim_time (
    dim_time_id INT PRIMARY KEY,
    order_time TIME,
    hour INT,
    minute INT,
    time_period VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS fact_sales (
    fact_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    pizza_id INT,
    dim_pizza_id INT,
    dim_date_id INT,
    dim_time_id INT,
    quantity INT,
    unit_price DECIMAL(15,2),
    total_price DECIMAL(15,2),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (dim_pizza_id) REFERENCES dim_pizza(dim_pizza_id),
    FOREIGN KEY (dim_date_id) REFERENCES dim_date(dim_date_id),
    FOREIGN KEY (dim_time_id) REFERENCES dim_time(dim_time_id)
);

-- Load dimension tables
-- Load dim_pizza
INSERT IGNORE INTO dim_pizza (pizza_id, pizza_name_id, pizza_name, pizza_category, pizza_size, pizza_ingredients, ingredient_count)
SELECT 
    pizza_id,
    pizza_name_id,
    pizza_name,
    pizza_category,
    pizza_size,
    pizza_ingredients,
    (LENGTH(pizza_ingredients) - LENGTH(REPLACE(pizza_ingredients, ',', '')) + 1) AS ingredient_count
FROM produk;

-- Load dim_date
INSERT IGNORE INTO dim_date (dim_date_id, order_date, year, quarter, month, day, day_of_week, day_name, month_name, is_weekend)
SELECT DISTINCT
    TO_DAYS(STR_TO_DATE(order_date, '%m/%d/%Y')) AS dim_date_id,
    STR_TO_DATE(order_date, '%m/%d/%Y') AS order_date,
    YEAR(STR_TO_DATE(order_date, '%m/%d/%Y')) AS year,
    QUARTER(STR_TO_DATE(order_date, '%m/%d/%Y')) AS quarter,
    MONTH(STR_TO_DATE(order_date, '%m/%d/%Y')) AS month,
    DAY(STR_TO_DATE(order_date, '%m/%d/%Y')) AS day,
    WEEKDAY(STR_TO_DATE(order_date, '%m/%d/%Y')) + 1 AS day_of_week,
    DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS day_name,
    MONTHNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS month_name,
    CASE WHEN WEEKDAY(STR_TO_DATE(order_date, '%m/%d/%Y')) IN (5,6) THEN TRUE ELSE FALSE END AS is_weekend
FROM pesanan
WHERE order_date IS NOT NULL;

-- Load dim_time
INSERT IGNORE INTO dim_time (dim_time_id, order_time, hour, minute, time_period)
SELECT DISTINCT
    HOUR(order_time)*3600 + MINUTE(order_time)*60 + SECOND(order_time) AS dim_time_id,
    order_time,
    HOUR(order_time) AS hour,
    MINUTE(order_time) AS minute,
    CASE 
        WHEN HOUR(order_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(order_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN HOUR(order_time) BETWEEN 18 AND 22 THEN 'Evening'
        ELSE 'Night'
    END AS time_period
FROM pesanan
WHERE order_time IS NOT NULL;

-- Load fact table
INSERT INTO fact_sales (order_id, pizza_id, dim_pizza_id, dim_date_id, dim_time_id, quantity, unit_price, total_price)
SELECT 
    dp.order_id,
    p.pizza_id,
    dim_p.dim_pizza_id,
    TO_DAYS(STR_TO_DATE(ps.order_date, '%m/%d/%Y')) AS dim_date_id,
    HOUR(ps.order_time)*3600 + MINUTE(ps.order_time)*60 + SECOND(ps.order_time) AS dim_time_id,
    dp.quantity,
    dp.unit_price,
    dp.total_price
FROM detail_pesanan dp
JOIN pesanan ps ON dp.order_id = ps.order_id
JOIN produk p ON dp.pizza_id = p.pizza_id
JOIN dim_pizza dim_p ON dim_p.pizza_id = p.pizza_id
WHERE ps.order_date IS NOT NULL AND ps.order_time IS NOT NULL;

-- =============================================
-- ETL VALIDATION
-- =============================================

SELECT 'ETL VALIDATION REPORT' AS phase;

-- Check record counts after ETL
SELECT 'Original Tables' AS table_type;
SELECT 'produk' AS table_name, COUNT(*) AS record_count FROM produk
UNION ALL
SELECT 'pesanan', COUNT(*) FROM pesanan
UNION ALL
SELECT 'detail_pesanan', COUNT(*) FROM detail_pesanan;

SELECT 'Data Warehouse Tables' AS table_type;
SELECT 'dim_pizza' AS table_name, COUNT(*) AS record_count FROM dim_pizza
UNION ALL
SELECT 'dim_date', COUNT(*) FROM dim_date
UNION ALL
SELECT 'dim_time', COUNT(*) FROM dim_time
UNION ALL
SELECT 'fact_sales', COUNT(*) FROM fact_sales;

-- Data quality check
SELECT 'Data Quality Issues' AS check_type;
SELECT 'Null Pizza Names' AS issue, COUNT(*) AS count FROM produk WHERE pizza_name IS NULL
UNION ALL
SELECT 'Invalid Dates', COUNT(*) FROM pesanan WHERE order_date IS NULL OR order_date = ''
UNION ALL
SELECT 'Zero Quantities', COUNT(*) FROM detail_pesanan WHERE quantity <= 0
UNION ALL
SELECT 'Negative Prices', COUNT(*) FROM detail_pesanan WHERE unit_price < 0;

-- Business metrics validation
SELECT 'Business Metrics' AS validation_type;
SELECT 'Total Revenue' AS metric, CONCAT('$', FORMAT(SUM(total_price), 2)) AS value FROM fact_sales
UNION ALL
SELECT 'Total Orders', FORMAT(COUNT(DISTINCT order_id), 0) FROM fact_sales
UNION ALL
SELECT 'Total Pizza Sold', FORMAT(SUM(quantity), 0) FROM fact_sales
UNION ALL
SELECT 'Average Order Value', CONCAT('$', FORMAT(AVG(total_price), 2)) FROM fact_sales;

SELECT 'ETL Process Completed Successfully!' AS status, NOW() AS completion_time;
