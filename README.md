# Sistem Rekam Medis

Sistem Rekam Medis adalah aplikasi web berbasis Laravel untuk mengelola data pasien, rekam medis, dan janji temu di klinik atau rumah sakit kecil.

## Fitur Utama

### 🏥 Manajemen Pasien
- Registrasi pasien baru dengan validasi lengkap
- Pencarian dan filter pasien berdasarkan nama, nomor pasien, atau telepon
- Profil pasien lengkap dengan informasi medis dan kontak darurat
- Riwayat medis dan alergi pasien

### 📋 Rekam Medis
- Pembuatan rekam medis baru dengan data lengkap
- Pencatatan keluhan utama, pemeriksaan fisik, dan diagnosis
- Tanda vital (berat badan, tinggi badan, tekanan darah, suhu, nadi)
- Rencana pengobatan dan catatan dokter
- Riwayat rekam medis per pasien

### 📅 Sistem Janji Temu
- Penjadwalan janji temu dengan dokter
- Manajemen status janji temu (terjadwal, dikonfirmasi, selesai, dibatalkan)
- Pencegahan konflik jadwal dokter
- Filter dan pencarian janji temu

### 📊 Laporan dan Statistik
- Laporan pasien (demografi, tren pendaftaran)
- Laporan rekam medis (diagnosis umum, aktivitas dokter)
- Laporan janji temu (tingkat kehadiran, tren booking)
- Laporan performa dokter (khusus admin)

### 🔐 Sistem Keamanan
- Autentikasi multi-role (Admin, Dokter, Perawat)
- Validasi input yang ketat dengan form request classes
- Audit logging untuk tracking aktivitas pengguna
- Middleware untuk kontrol akses berdasarkan role

## Teknologi yang Digunakan

- **Backend**: Laravel 9.x
- **Database**: MySQL
- **Frontend**: Blade Templates dengan Tailwind CSS
- **Authentication**: Laravel Breeze
- **Validation**: Form Request Classes
- **Security**: Custom Middleware, Audit Logging

## Persyaratan Sistem

- PHP >= 8.0
- Composer
- MySQL >= 5.7
- Node.js & NPM (untuk asset compilation)
- Web Server (Apache/Nginx)

## Instalasi

### 1. Clone Repository
```bash
git clone <repository-url>
cd rekam_medis
```

### 2. Install Dependencies
```bash
composer install
npm install
```

### 3. Environment Setup
```bash
cp .env.example .env
php artisan key:generate
```

### 4. Database Configuration
Edit file `.env` dan sesuaikan konfigurasi database:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=rekam_medis
DB_USERNAME=root
DB_PASSWORD=
```

### 5. Database Migration & Seeding
```bash
php artisan migrate
php artisan db:seed
```

### 6. Compile Assets
```bash
npm run dev
# atau untuk production
npm run build
```

### 7. Start Development Server
```bash
php artisan serve
```

Aplikasi akan tersedia di `http://localhost:8000`

## Default User Accounts

Setelah menjalankan seeder, Anda dapat login dengan akun berikut:

### Administrator
- **Email**: admin@rekammedis.com
- **Password**: password

### Dokter
- **Email**: ahmad.wijaya@rekammedis.com
- **Password**: password
- **Spesialisasi**: Penyakit Dalam

### Perawat
- **Email**: maria.magdalena@rekammedis.com
- **Password**: password

## Struktur Database

### Tabel Utama
- `users` - Data pengguna (admin, dokter, perawat)
- `patients` - Data pasien
- `medical_records` - Rekam medis
- `appointments` - Janji temu
- `diagnoses` - Detail diagnosis
- `prescriptions` - Resep obat
- `audit_logs` - Log aktivitas sistem

### Relasi Database
- User (Dokter) → Medical Records (1:N)
- User (Dokter) → Appointments (1:N)
- Patient → Medical Records (1:N)
- Patient → Appointments (1:N)
- Medical Record → Diagnoses (1:N)
- Medical Record → Prescriptions (1:N)

## Panduan Penggunaan

### Untuk Administrator
1. **Dashboard**: Melihat statistik keseluruhan sistem
2. **Manajemen Pasien**: Mengelola data pasien
3. **Laporan**: Mengakses semua jenis laporan
4. **Manajemen Pengguna**: Mengelola akun dokter dan perawat

### Untuk Dokter
1. **Dashboard**: Melihat jadwal dan pasien hari ini
2. **Rekam Medis**: Membuat dan mengelola rekam medis
3. **Janji Temu**: Melihat jadwal appointment
4. **Laporan**: Melihat laporan aktivitas sendiri

### Untuk Perawat
1. **Dashboard**: Melihat jadwal keseluruhan
2. **Manajemen Pasien**: Registrasi dan update data pasien
3. **Janji Temu**: Membuat dan mengelola appointment

## Fitur Keamanan

### Validasi Input
- Validasi nama hanya huruf dan spasi
- Validasi nomor telepon dengan format yang benar
- Validasi tanggal lahir (tidak boleh masa depan)
- Validasi email yang unik
- Sanitasi input untuk mencegah XSS

### Kontrol Akses
- Middleware role-based untuk setiap route
- Dokter hanya bisa edit rekam medis sendiri
- Admin memiliki akses penuh
- Perawat memiliki akses terbatas

### Audit Logging
- Pencatatan semua aktivitas CRUD
- Tracking login/logout pengguna
- Penyimpanan IP address dan user agent
- Log perubahan data (old vs new values)
