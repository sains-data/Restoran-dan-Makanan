
CREATE TABLE dimtanggal (
    id_tanggal SERIAL PRIMARY KEY,
    tanggal_pesanan DATE UNIQUE,
    tahun INT,
    kuartal INT,
    bulan INT,
    hari INT,
    hari_dalam_minggu INT,
    nama_hari VARCHAR(10),
    nama_bulan VARCHAR(10)
);

-- INDEXES FOR dimtanggal
CREATE INDEX idx_order_date ON dimtanggal(tanggal_pesanan);
CREATE INDEX idx_tahun ON dimtanggal(tahun);
CREATE INDEX idx_kuartal ON dimtanggal(kuartal);
CREATE INDEX idx_bulan ON dimtanggal(bulan);
CREATE INDEX idx_hari ON dimtanggal(hari);
CREATE INDEX idx_hari_dalam_minggu ON dimtanggal(hari_dalam_minggu);
CREATE INDEX idx_nama_hari ON dimtanggal(nama_hari);
CREATE INDEX idx_nama_bulan ON dimtanggal(nama_bulan);

CREATE TABLE dimwaktu (
    id_waktu SERIAL PRIMARY KEY,
    waktu_pesanan TIME UNIQUE,
    jam INT,
    menit INT,
    detik INT,
    waktu_dalam_hari VARCHAR(20)
);

-- INDEXES FOR dimwaktu
CREATE INDEX idx_waktu_pesanan ON dimwaktu(waktu_pesanan);
CREATE INDEX idx_jam ON dimwaktu(jam);
CREATE INDEX idx_menit ON dimwaktu(menit);
CREATE INDEX idx_detik ON dimwaktu(detik);
CREATE INDEX idx_waktu_dalam_hari ON dimwaktu(waktu_dalam_hari);

CREATE TABLE dimukuranpizza (
    id_ukuran_pizza SERIAL PRIMARY KEY,
    ukuran_pizza VARCHAR(50) UNIQUE
);

CREATE TABLE dimpizza (
    kunci_pizza SERIAL PRIMARY KEY,
    id_nama_pizza VARCHAR(255) UNIQUE,
    nama_pizza VARCHAR(255),
    kategori_pizza VARCHAR(50),
    bahan_pizza TEXT
);

-- INDEXES FOR dimpizza
CREATE INDEX idx_nama_pizza ON dimpizza(nama_pizza);
CREATE INDEX idx_kategori_pizza ON dimpizza(kategori_pizza);

CREATE TABLE faktapenjualanpizza (
    id_fakta SERIAL PRIMARY KEY,
    id_pizza VARCHAR(50),
    id_pesanan VARCHAR(50),
    id_tanggal INT,
    id_waktu INT,
    kunci_pizza INT,
    id_ukuran_pizza INT,
    kuantitas INT,
    harga_satuan NUMERIC(10,2),
    total_harga NUMERIC(10,2),
    FOREIGN KEY (id_tanggal) REFERENCES dimtanggal(id_tanggal),
    FOREIGN KEY (id_waktu) REFERENCES dimwaktu(id_waktu),
    FOREIGN KEY (kunci_pizza) REFERENCES dimpizza(kunci_pizza),
    FOREIGN KEY (id_ukuran_pizza) REFERENCES dimukuranpizza(id_ukuran_pizza)
);

-- INDEXES FOR faktapenjualanpizza
CREATE INDEX fk_idx_id_tanggal ON faktapenjualanpizza(id_tanggal);
CREATE INDEX fk_idx_id_waktu ON faktapenjualanpizza(id_waktu);
CREATE INDEX fk_idx_kunci_pizza ON faktapenjualanpizza(kunci_pizza);
CREATE INDEX fk_idx_id_ukuran_pizza ON faktapenjualanpizza(id_ukuran_pizza);
CREATE INDEX idx_id_pizza ON faktapenjualanpizza(id_pizza);
CREATE INDEX idx_id_pesanan ON faktapenjualanpizza(id_pesanan);

INSERT INTO dimtanggal (tanggal_pesanan, tahun, kuartal, bulan, hari, hari_dalam_minggu, nama_hari, nama_bulan)
VALUES
('2015-01-01', 2015, 1, 1, 1, 4, 'Thursday', 'January');

INSERT INTO dimwaktu (waktu_pesanan, jam, menit, detik, waktu_dalam_hari) VALUES
('10:15:00', 10, 15, 0, 'Pagi'),
('13:45:00', 13, 45, 0, 'Siang'),
('18:30:00', 18, 30, 0, 'Sore'),
('21:00:00', 21, 0, 0, 'Malam');

INSERT INTO dimukuranpizza (ukuran_pizza) VALUES
('S'), ('M'), ('L');

INSERT INTO dimpizza (id_nama_pizza, nama_pizza, kategori_pizza, bahan_pizza) VALUES
('hawaiian_m', 'The Hawaiian Pizza', 'Classic', 'Sliced Ham, Pineapple, Mozzarella Cheese'),
('classic_dlx_m', 'The Classic Deluxe Pizza', 'Classic', 'Pepperoni, Mushrooms, Red Onions, Red Peppers, Bacon'),
('five_cheese_l', 'The Five Cheese Pizza', 'Veggie', 'Mozzarella Cheese, Provolone Cheese, Smoked Gouda Cheese, Romano Cheese, Blue Cheese, Garlic'),
('ital_supr_l', 'The Italian Supreme Pizza', 'Supreme', 'Calabrese Salami, Capocollo, Tomatoes, Red Onions, Green Olives, Garlic'),
('mexicana_m', 'The Mexicana Pizza', 'Veggie', 'Tomatoes, Red Peppers, Jalapeno Peppers, Red Onions, Cilantro, Corn, Chipotle Sauce, Garlic'),
('thai_ckn_l', 'The Thai Chicken Pizza', 'Chicken', 'Chicken, Pineapple, Tomatoes, Red Peppers, Thai Sweet Chilli Sauce'),
('ital_supr_m', 'The Italian Supreme Pizza', 'Supreme', 'Calabrese Salami, Capocollo, Tomatoes, Red Onions, Green Olives, Garlic'),
('prsc_argla_l', 'The Prosciutto and Arugula Pizza', 'Supreme', 'Prosciutto di San Daniele, Arugula, Mozzarella Cheese'),
('bbq_ckn_s', 'The Barbecue Chicken Pizza', 'Chicken', 'Barbecued Chicken, Red Peppers, Green Peppers, Tomatoes, Red Onions, Barbecue Sauce'),
('the_greek_s', 'The Greek Pizza', 'Classic', 'Kalamata Olives, Feta Cheese, Tomatoes, Garlic, Beef Chuck Roast, Red Onions'),
('spinach_supr_s', 'The Spinach Supreme Pizza', 'Supreme', 'Spinach, Red Onions, Pepperoni, Tomatoes, Artichokes, Kalamata Olives, Garlic, Asiago Cheese'),
('classic_dlx_s', 'The Classic Deluxe Pizza', 'Classic', 'Pepperoni, Mushrooms, Red Onions, Red Peppers, Bacon'),
('green_garden_s', 'The Green Garden Pizza', 'Veggie', 'Spinach, Mushrooms, Tomatoes, Green Olives, Feta Cheese'),
('ital_cpcllo_l', 'The Italian Capocollo Pizza', 'Classic', 'Capocollo, Red Peppers, Tomatoes, Goat Cheese, Garlic, Oregano'),
('ital_supr_s', 'The Italian Supreme Pizza', 'Supreme', 'Calabrese Salami, Capocollo, Tomatoes, Red Onions, Green Olives, Garlic'),
('mexicana_s', 'The Mexicana Pizza', 'Veggie', 'Tomatoes, Red Peppers, Jalapeno Peppers, Red Onions, Cilantro, Corn, Chipotle Sauce, Garlic');

INSERT INTO faktapenjualanpizza (id_pizza, id_pesanan, id_tanggal, id_waktu, kunci_pizza, id_ukuran_pizza, kuantitas, harga_satuan, total_harga) VALUES
('hawaiian_m', '001', 1, 1, 1, 2, 1, 75000, 75000),
('classic_dlx_m', '002', 1, 2, 2, 2, 1, 80000, 80000),
('five_cheese_l', '002', 1, 2, 3, 3, 1, 95000, 95000),
('ital_supr_l', '002', 1, 2, 4, 3, 1, 90000, 90000),
('mexicana_m', '002', 1, 2, 5, 2, 1, 82000, 82000),
('thai_ckn_l', '002', 1, 2, 6, 3, 1, 92000, 92000),
('ital_supr_m', '003', 1, 3, 7, 2, 1, 88000, 88000),
('prsc_argla_l', '003', 1, 3, 8, 3, 1, 100000, 100000),
('ital_supr_m', '004', 1, 3, 7, 2, 1, 88000, 88000),
('ital_supr_m', '005', 1, 3, 7, 2, 1, 88000, 88000),
('bbq_ckn_s', '006', 1, 3, 9, 1, 1, 85000, 85000),
('the_greek_s', '006', 1, 3, 10, 1, 1, 82000, 82000),
('spinach_supr_s', '007', 1, 4, 11, 1, 1, 89000, 89000),
('spinach_supr_s', '008', 1, 4, 11, 1, 1, 89000, 89000),
('classic_dlx_s', '009', 1, 4, 12, 1, 1, 80000, 80000),
('green_garden_s', '009', 1, 4, 13, 1, 1, 81000, 81000),
('ital_cpcllo_l', '009', 1, 4, 14, 3, 1, 90000, 90000),
('ital_supr_l', '009', 1, 4, 4, 3, 1, 90000, 90000),
('ital_supr_s', '009', 1, 4, 15, 1, 1, 87000, 87000),
('mexicana_s', '009', 1, 4, 16, 1, 1, 83000, 83000);




























