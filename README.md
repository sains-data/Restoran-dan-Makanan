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

## 4. Ruang Lingkup Sistem
Sistem ini memiliki ruang lingkup yang mencakup integrasi data penjualan restoran pizza dari berbagai sumber operasional ke dalam sebuah data warehouse yang terstruktur menggunakan skema bintang.  Proses ETL akan digunakan untuk mengekstrak, mentransformasi, dan memuat data ke dalam tabel fakta dan dimensi.  Data warehouse ini akan mendukung analisis penjualan yang mendalam, seperti identifikasi pizza terlaris dan tren penjualan, serta membantu optimasi operasional restoran, terutama dalam pengelolaan stok bahan baku.  Selain itu, sistem akan dioptimalkan untuk performa kueri yang efisien.

## 5. Metodologi 
Metodologi yang digunakan dalam proyek data warehouse untuk restoran pizza ini mengikuti pendekatan terstruktur dengan penekanan pada kebutuhan bisnis (business-driven). Secara umum, tahapan pengembangan ini dapat dianalogikan dengan model Waterfall, di mana setiap tahapan memiliki keluaran yang menjadi masukan untuk tahapan berikutnya. Metodologi ini melibatkan beberapa tahapan utama, mulai dari spesifikasi kebutuhan, perancangan skema konseptual, hingga implementasi dan evaluasi data warehouse.
1. Model Waterfall dari Tahapan Misi 1-4
   * Misi 1 : Spesifikasi Kebutuhan

     Fokusnya adalah memahami kebutuhan bisnis restoran pizza terkait analisis data. Kegiatan utama meliputi; Identifikasi pengguna (departemen dan peran) dan kebutuhan informasi mereka, definisi kebutuhan bisnis dalam bentuk pertanyaan analitis, penentuan fakta dan dimensi yang relevan untuk menjawab pertanyaan tersebut, dan identifikasi sumber data (file pizza_sales.csv) dan strukturnya.
   * Misi 2: Desain Konseptual

     Fokusnya adalah merancang skema data warehouse secara konseptual. Kegiatan utama; Pemodelan skema bintang (Star Schema), definisi tabel fakta dan dimensi beserta atributnya, justifikasi desain berdasarkan kebutuhan bisnis yang telah diidentifikasi, dan pemetaan antara sumber data dan elemen skema bintang.
   * Misi 3: Desain Logikal dan Fisikal

     Fokusnya adalah menerjemahkan desain konseptual menjadi implementasi fisik dalam DBMS. Kegiatan utama; Desain logikal tabel dimensi dan fakta, termasuk penentuan tipe data dan key constraints, implementasi tabel-tabel tersebut dalam DBMS (contoh kode SQL), proses ETL (Extract, Transform, Load) dari sumber data ke tabel data warehouse (contoh kode Python), desain dan implementasi index untuk optimasi query, dan pertimbangan desain fisikal (partisi tabel, view).
   * Misi 4: Implementasi, Reporting, dan Produksi

     Fokusnya adalah implementasi skema data warehouse di SQL Server, proses ETL, dan query analitik.
3. Tools yang Digunakan
   * DBMS (Database Management System): SQL Server
   * ETL: Script SQL
   * Visualisasi: Power BI atau Tableau

## 6. Analisis Kebutuhan
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

## 7. Desain konseptual
1. Model Skema: Menggunakan Star Schema. Star schema terdiri dari satu tabel fakta sentral yang berfungsi sebagai pusat gravitasi untuk semua data transaksional, serta serangkaian tabel dimensi yang mengelilinginya, yang masing-masing menyediakan konteks deskriptif.
2. Tabel Fakta Utama: `Fact_Penjualan`
   * Metrik yang dicatat dalam tabel ini adalah `quantity`, yang merepresentasikan jumlah pizza yang terjual dalam setiap transaksi. 
   * Foreign Keys: `pizza_name_id` , `pizza_size` , `order_date` , `pizza_ingredients`.
4. Tabel Dimensi:
   * `Dim_Pizza` : menyimpan nama pizza, dimensi ini mencakup berbagai atribut relevan seperti `pizza_name_id`, `pizza_name`, dan `pizza_category`.
   * `Dim_UkuranPizza` : Menyimpan atribut ukuran pizza (`pizza_size`, `size_category`).
   * `Dim_Waktu` : Menyimpan atribut waktu (`order_date`, `bulan`, `tahun`, `hari`).
   * `Dim_BahanBaku` : Menyimpan atribut bahan baku pizza (`pizza_ingredients`, `stok_tersedia`).
6. Granularitas Data: Data dalam data warehouse ini dirancang untuk disimpan pada tingkat granularitas yang sangat tinggi, di mana setiap catatan dalam tabel fakta merepresentasikan satu transaksi penjualan pizza individual.
7. Hubungan Antar Tabel: Relasi one-to-many dari setiap tabel dimensi ke tabel fakta `Fact_Penjualan`
8. Justifikasi Desain: Desain ini berorientasi pada kebutuhan bisnis (business-driven), mempermudah analisis penjualan, tren, dan stok bahan baku.

## 8. Desain Logikal
Desain logikal adalah tahapan penting dalam pengembangan data warehouse yang menjembatani antara model konseptual dan implementasi fisik dalam sistem database. Desain logikal ini melibatkan penerjemahan skema bintang konseptual menjadi tabel-tabel relasional dengan tipe data, primary key, dan foreign key yang spesifik.
1. Tabel Dimensi
   * `Dim_Pizza` (`pizza_name_id` VARCHAR(20) PRIMARY KEY, `pizza_name` VARCHAR(100), `pizza_category` VARCHAR(50))
   * `Dim_Waktu` (`order_date` DATE PRIMARY KEY, `hari` VARCHAR(10), `bulan` TINYINT, `tahun` SMALLINT)
   * `Dim_Ukuran` (`pizza_size` VARCHAR(10) PRIMARY KEY, `size_category` VARCHAR(50))
   * `Dim_BahanBaku` (`pizza_ingredients` VARCHAR(255) PRIMARY KEY, `stok_tersedia` INT) 
3. Tabel Fakta

   `Fact_Penjualan` (`order_id` INT PRIMARY KEY, `pizza_name_id` VARCHAR(20), `pizza_size` VARCHAR(10), `pizza_category` VARCHAR(50), `order_date` DATE, `pizza_ingredients` VARCHAR(255), `quantity` INT)

## 9. Desain Fisikal
Desain fisikal adalah tahap akhir dalam perancangan data warehouse, di mana desain logikal diimplementasikan ke dalam sistem manajemen basis data (DBMS) tertentu. Fokus utamanya adalah pada implementasi efisien dan optimalisasi kinerja untuk mendukung analisis data yang cepat dan akurat.
1. Strategi Indexing: Mempercepat Akses Data
   * Penerapan Indeks pada Foreign Key: Indeks ditempatkan pada kolom-kolom foreign key di tabel `Fact_Penjualan`.  Ini penting karena foreign key digunakan untuk menghubungkan tabel fakta dengan tabel dimensi. Dengan mengindeks kolom-kolom ini, query yang melibatkan operasi join (penggabungan tabel) dapat dieksekusi dengan jauh lebih cepat.
   * Indeks pada Kolom Dimensi untuk Query Analitis: Indeks diterapkan pada kolom-kolom dalam tabel dimensi yang sering digunakan dalam klausa WHERE (untuk memfilter data), JOIN (untuk menggabungkan data), dan GROUP BY (untuk mengelompokkan data). Contohnya, pada tabel `Dim_Waktu`, kolom `bulan` dan `tahun` adalah kandidat yang baik untuk diindeks karena analisis sering kali melibatkan pengelompokan penjualan berdasarkan periode waktu tersebut.
   * Implementasi dalam SQL:
2. Partisi Tabel dan View: Manajemen Data dan Penyederhanaan Query
   * Partisi Tabel Fakta: Partisi pada tabel `Fact_Penjualan` berdasarkan kolom `order_date` (dari `Dim_Waktu`) untuk meningkatkan efisiensi penjualan dalam periode waktu tertentu, sehingga mempercepat waktu eksekusi.
   * View untuk Penyederhanaan Query: View digunakan untuk menyederhanakan query SQL yang kompleks dan menyajikan data dalam bentuk agregat yang lebih mudah dipahami. Contohnya, dapat dibuat sebuah view `vw_penjualan_kategori_tahunan` yang digunakan untuk melihat tren penjualan masing-masing kategori produk dari tahun ke tahun.

## 10. Proses implementasi
Implementasi data warehouse dilakukan dengan langkah-langkah berikut:
1. Implementasi Gudang Data di SQL Server

   Gudang data dibangun dengan pendekatan **Star Schema**, yang terdiri dari satu tabel fakta (`FaktaPenjualanPizza`) dan beberapa tabel dimensi (`DimTanggal`, `DimWaktu`, `DimPizza`, `DimUkuranPizza`).
   **Struktur Tabel Fakta**
   ```sql
   CREATE TABLE FaktaPenjualanPizza (
    id_fakta INT PRIMARY KEY,
    id_tanggal INT,
    id_waktu INT,
    kunci_pizza INT,
    id_ukuran_pizza INT,
    kuantitas INT,
    harga_satuan DECIMAL(10,2),
    total_harga DECIMAL(10,2)
   );
   ```

   **Struktur Tabel Dimensi**
   ```sql
   CREATE TABLE DimTanggal (
    id_tanggal INT PRIMARY KEY,
    tanggal_pesanan DATE,
    tahun INT,
    bulan INT,
    kuartal INT,
    hari INT,
    nama_hari VARCHAR(10),
    nama_bulan VARCHAR(15)
   );

   CREATE TABLE DimWaktu (
    id_waktu INT PRIMARY KEY,
    waktu_pesanan TIME,
    jam INT,
    menit INT,
    detik INT,
    waktu_dalam_hari VARCHAR(10)
   );

   CREATE TABLE DimPizza (
    kunci_pizza INT PRIMARY KEY,
    nama_pizza VARCHAR(100),
    kategori_pizza VARCHAR(50),
    bahan_pizza TEXT
   );

   CREATE TABLE DimUkuranPizza (
    id_ukuran_pizza INT PRIMARY KEY,
    ukuran_pizza VARCHAR(10)
   );
   ```
   
3. Proses ETL

   **Extract**
   Data diekstraksi dari file `pizza_sales.csv`. Validasi dilakukan dengan mengecek jumlah record pada tabel `produk`, `pesanan`, dan `detail_pesanan`
   ```sql
   SELECT COUNT(*) AS jumlah_produk FROM produk
   UNION ALL
   SELECT COUNT(*) AS jumlah_pesanan FROM pesanan
   UNION ALL
   SELECT COUNT(*) AS jumlah_detail FROM detail_pesanan;
   ```

   **Transform**
   - Perbaikan `order_date` kosong atau NULL.
   - Perhitungan ulang `total_price` = `quantity * unit_price` .
   - Normalisasi ukuran pizza (S, M, L, XL) → huruf kapital .
   - Hapus duplikat berdasarkan `pizza_name_id`

   **Load**
   - Memasukkan data bersih ke tabel `dim_pizza`, `dim_date`, `dim_time`
   - Memasukkan data gabungan ke `fact_sales`

5. Query Analitik

   **Total Penjualan per Bulan**
   ```sql
   SELECT DATE_TRUNC('month', order_date) AS bulan, SUM(total_price) AS total_penjualan
   FROM fact_sales
   GROUP BY DATE_TRUNC('month', order_date)
   ORDER BY bulan;
   ```

   **Rata-rata Transaksi per Order**
   ```sql
   SELECT AVG(total_price) AS rata_transaksi
   FROM fact_sales;
   ```

   **Produk Terlaris Berdasarkan Kategori**
   ```sql
   SELECT p.pizza_category, p.pizza_name, SUM(d.quantity) AS total_terjual
   FROM detail_pesanan d
   JOIN produk p ON d.pizza_id = p.pizza_id
   GROUP BY p.pizza_category, p.pizza_name
   ORDER BY total_terjual DESC;
   ```

   **Analisis Jam Sibuk**
   ```sql
   SELECT EXTRACT(HOUR FROM order_time) AS jam, COUNT(*) AS total_pesanan, SUM(total_price) AS total_pendapatan
   FROM pesanan
   GROUP BY jam
   ORDER BY total_pesanan DESC;
   ```

## 11. Hasil implementasi
1. Grafik
   ![gambar_hasil_analisis](https://github.com/user-attachments/assets/46601eb7-8150-483e-8491-08d92d076ce1)
   
2. Penjualan Bulanan

   Grafik ini menunjukkan tren total penjualan pizza setiap bulan sepanjang tahun. Terlihat bahwa penjualan relatif stabil dari Januari hingga Desember, tanpa lonjakan signifikan. Meskipun begitu, terdapat sedikit peningkatan penjualan pada bulan Oktober dan Desember yang bisa dikaitkan dengan momen promosi akhir tahun atau hari libur. Hal ini menunjukkan bahwa pola penjualan cenderung konsisten, namun dapat ditingkatkan dengan strategi promosi yang lebih agresif pada bulan-bulan sepi.
   
3. Penjualan Berdasarkan Kategori Pizza
   Visualisasi ini menunjukkan bahwa kategori pizza Classic merupakan yang paling populer, disusul oleh Supreme, Veggie, dan Chicken. Dengan Classic sebagai kategori terlaris, restoran dapat mempertimbangkan untuk memperluas varian menu dalam kategori ini atau menyesuaikan strategi promosi untuk mendorong pembelian kategori lainnya. Performa yang seimbang antara Supreme, Veggie, dan Chicken juga menunjukkan bahwa selera pelanggan cukup beragam.
   
5. Analisis Jam Sibuk
   Grafik jam sibuk memperlihatkan bahwa puncak aktivitas pembelian terjadi antara pukul 11.00 hingga 13.00 dan kembali meningkat sekitar pukul 17.00 hingga 19.00. Hal ini menunjukkan adanya dua periode sibuk utama yaitu jam makan siang dan makan malam. Informasi ini sangat berguna bagi manajemen operasional untuk mengatur jadwal kerja staf, persiapan dapur, serta strategi promosi seperti diskon terbatas pada jam sibuk untuk memaksimalkan omset.

## 12. Evaluasi
1. Apa yang Berhasil
   - Implementasi Star Schema berhasil dijalankan dengan struktur yang rapi dan mendukung analisis multidimensi.
   - Tabel dimensi seperti `DimTanggal`, `DimPizza`, `DimUkuranPizza`, dan `DimWaktu` dibangun sesuai kebutuhan analisis.
   - View OLAP seperti `vw_penjualan_kategori_tahunan` dan `vw_penjualan_promosi` membantu pengguna non-teknis mengakses ringkasan data dengan mudah.

2. Apa yang Belum
   - Belum dilakukan pengujian performa secara menyeluruh terhadap sistem dengan skala data besar.
   - Dashboard visualisasi dan integrasi antarmuka pengguna belum dikembangkan.

3. Kendala Teknis
   - Proses integrasi data dari berbagai sumber masih membutuhkan standarisasi lebih lanjut.
   - Beberapa query kompleks memerlukan optimasi tambahan seiring bertambahnya volume data.

## 13. Rencana pengembangan ke depan
Gudang data ini akan dikembangkan lebih lanjut dengan mengintegrasikan data eksternal seperti sistem CRM dan media sosial guna memperkaya analisis pelanggan. Pembuatan dashboard interaktif untuk visualisasi penjualan dan tren konsumen juga menjadi prioritas. Selain itu, analisis prediktif seperti peramalan penjualan dan rekomendasi produk akan ditambahkan menggunakan machine learning. Dari sisi teknis, sistem akan dioptimasi untuk performa dan skalabilitas melalui teknik partisi, indexing lanjutan, dan dukungan paralelisasi.

## 14. Tim Proyek 
**Kelompok 17 RB :**
- Azizah Kusumah Putri        - 122450068
- Deyvan Loxefal              - 121450148
- Allya Nurul Islami Pasha    - 122450033
- Naufal Fakhri               - 122450089
- Anwar Muslim                - 122450117
- Dhafin Razaqa Luthfi        - 122450133
