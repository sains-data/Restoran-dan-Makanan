# IMPLEMENTASI DATA WAREHOUSE DI BIDANG RESTORAN DAN MAKANAN PADA PENJUALAN PIZZA

## 1. Ringkasan Proyek
Proyek ini berfokus pada perancangan dan implementasi data warehouse untuk restoran pizza, dengan tujuan untuk mendukung analisis dan pengambilan keputusan yang lebih baik. Data warehouse ini akan mengintegrasikan data dari berbagai sumber operasional seperti data penjualan, produk, dan waktu transaksi, yang selama ini terpisah-pisah, ke dalam satu kesatuan yang terstruktur.  Dengan menggunakan skema bintang, data akan diorganisasi secara efisien, memisahkan data transaksi kuantitatif dalam tabel fakta dan informasi deskriptif dalam tabel dimensi.  Proses ETL (Extract, Transform, Load) akan digunakan untuk memindahkan dan menyesuaikan data dari sumber asli ke dalam data warehouse, memastikan data yang akurat dan relevan untuk analisis.

## 2. Latar Belakang Masalah 
Industri makanan, khususnya restoran pizza, terus mengalami pertumbuhan yang signifikan seiring dengan meningkatnya gaya hidup praktis dan tingginya permintaan konsumen terhadap makanan cepat saji yang berkualitas. Restoran pizza menjadi pilihan populer karena kecepatan pelayanan, variasi menu, serta rasa yang mudah diterima oleh berbagai kalangan. Namun, di balik pertumbuhan tersebut, terdapat sejumlah tantangan yang perlu dihadapi oleh manajemen restoran, khususnya dalam hal pengelolaan dan analisis data penjualan. Banyak restoran masih bergantung pada sistem operasional yang terpisah-pisah dan belum terintegrasi, sehingga menyulitkan mereka untuk melihat gambaran besar dari performa bisnis yang sebenarnya. Misalnya, manajemen kesulitan mengetahui pizza jenis apa yang paling sering dibeli, kapan waktu penjualan tertinggi terjadi, atau bagaimana efektivitas promosi yang sudah dijalankan. Selain itu, pengelolaan stok bahan baku menjadi tidak optimal karena tidak didukung oleh data penjualan historis yang dapat dijadikan acuan. Oleh karena itu, diperlukan perancangan sistem Data Warehouse (DW) yang mampu mengonsolidasikan seluruh data transaksi penjualan, produk, dan waktu ke dalam satu sistem terpusat.

## 3. Tujuan
Proyek ini bertujuan untuk melakukan perancangan dan implementasi Data Warehouse pada restoran pizza.
1. Perancangan dan implementasi data warehouse berbasis skema bintang untuk restoran pizza.
2. Pembangunan pipeline ETL untuk integrasi dan transformasi data penjualan pizza dari sistem operasional ke data warehouse.
3. Implementasi tabel fakta dan dimensi untuk mendukung analisis penjualan, inventaris, dan tren waktu.
4. Pengoptimalan kinerja data warehouse melalui desain indeks dan strategi partisi data.

## 4. Metodologi 
Metodologi yang digunakan dalam proyek ini adalah pendekatan Business-Driven. Pendekatan ini menekankan pada identifikasi kebutuhan bisnis terlebih dahulu, yang kemudian menjadi dasar untuk perancangan dan implementasi data warehouse. Metodologi ini melibatkan beberapa tahapan utama, mulai dari spesifikasi kebutuhan, perancangan skema konseptual, hingga implementasi dan evaluasi data warehouse.

## 5. Analisis Kebutuhan
Analisis Kebutuhan adalah fondasi dari seluruh proyek data warehouse. Di sinilah kita mengidentifikasi dengan jelas apa yang diinginkan dan dibutuhkan dari sistem data warehouse. Pendekatan yang digunakan adalah Business-Driven, yang berarti kebutuhan bisnis menjadi fokus utama.
1. Identifikasi Pengguna

   Identifikasi Pengguna bertujuan untuk memahami siapa saja yang akan menggunakan data warehouse ini. Dalam kasus restoran pizza, terdapat beberapa kelompok pengguna dengan kebutuhan informasi yang berbeda:
   1. Departemen Eksekutif: Seperti dewan direksi, yang memerlukan gambaran besar tentang performa bisnis untuk pengambilan keputusan strategis.
   2. Departemen Manajerial: Manajer cabang, pemasaran, dan keuangan, yang membutuhkan data operasional untuk mengelola kegiatan sehari-hari dan membuat keputusan taktis.
   3. Departemen Operasional: Seperti kepala koki, staf gudang, dan tim pembelian, yang memerlukan data untuk mengelola stok bahan baku dan operasional harian.
3. Definisi Kebutuhan Bisnis
   1. Mengetahui jenis pizza yang paling banyak dibeli.
   2. Mengetahui waktu penjualan tertinggi.
   3. Melihat tren pembelian berdasarkan ukuran atau kategori pizza.
   4. Memperkirakan stok bahan baku berdasarkan pola penjualan. 
4. Operasionalisasi Kebutuhan ke dalam Metrik Analitik
   1. Fakta: berupa data kuantitatif yang dapat diukur, seperti quantity (jumlah pizza yang dipesan), unit_price (harga satuan), dan total_price (total harga).
   2. Dimensi: berupa data deskriptif yang memberikan konteks pada fakta, seperti pizza_name (nama pizza), pizza_category (kategori pizza), order_date (tanggal pemesanan), dan order_time (waktu pemesanan).
5. Pencocokan dengan Struktur Data Sumber

   Langkah terakhir dalam analisis kebutuhan adalah memetakan metrik analitik dengan kolom-kolom yang tersedia dalam data sumber file pizza_sales.csv dan memastikan bahwa semua data yang dibutuhkan untuk menjawab pertanyaan bisnis tersedia dan dapat diakses.

## 6. Desain konseptual, logikal, dan fisikal

## Kelompok 17 RB :
- Azizah Kusumah Putri        - 122450068
- Deyvan Loxefal              - 121450148
- Allya Nurul Islami Pasha    - 122450033
- Naufal Fakhri               - 122450089
- Anwar Muslim                - 122450117
- Dhafin Razaqa Luthfi        - 122450133
