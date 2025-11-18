# Responsi - MyTokoApp

Aplikasi mobile Flutter untuk menampilkan data toko dari API Jikan dengan fitur autentikasi, favorites, dan profile management.

## 📱 Tentang Aplikasi

Aplikasi ini dibuat sebagai responsi praktikum mobile programming yang menampilkan daftar Toko terpopuler menggunakan Jikan API (MyTokoList API). Aplikasi dilengkapi dengan sistem autentikasi lokal, fitur favorit, dan manajemen profil pengguna dengan kemampuan upload foto profil.

## ✨ Fitur Utama

### 1. 📝 Halaman Register

- Form registrasi dengan username dan password (wajib)
- Field tambahan: Nama Lengkap dan NIM (opsional)
- Validasi input
- Data user disimpan ke Hive (local database)
- Auto redirect ke halaman login setelah registrasi berhasil

### 2. 🔐 Halaman Login

- Form login dengan username dan password
- Validasi kredensial dengan data Hive
- Session login disimpan ke SharedPreferences
- Auto login jika session masih aktif

### 3. 🏠 Halaman Utama (Home)

- Menampilkan top Toko dari API Jikan
- Grid view dengan poster, judul, dan rating
- Pull to refresh
- Navigasi ke halaman detail

### 4. 📄 Halaman Detail

- Informasi lengkap Toko (poster, judul, score, sinopsis, episodes, status)
- Tombol favorite untuk menyimpan ke daftar favorit
- Icon favorite berubah warna saat diklik
- Data favorit disimpan ke SharedPreferences

### 5. ⭐ Halaman Favorites

- Menampilkan daftar Toko favorit
- Grid view dengan poster, judul, dan rating
- Badge favorite pada setiap card
- Navigasi ke halaman detail

### 6. 👤 Halaman Profile

- Menampilkan foto profil, nama, NIM, dan username
- Username diambil dari database Hive
- Tombol logout dengan konfirmasi
- **Fitur Kamera**: Ambil foto dari kamera atau galeri
- Foto profil disimpan ke SharedPreferences

## 🛠️ Teknologi yang Digunakan

| Teknologi             | Fungsi                                         |
| --------------------- | ---------------------------------------------- |
| **Flutter SDK**       | Framework UI cross-platform                    |
| **Hive**              | Local database NoSQL untuk menyimpan data user |
| **SharedPreferences** | Menyimpan session login dan data favorit       |
| **HTTP Package**      | Fetch data dari REST API                       |
| **Image Picker**      | Mengambil foto dari kamera/galeri              |
| **Jikan API**         | Sumber data Toko (MyTokoList unofficial API)   |

### API Endpoint

- **Base URL**: `https://fakestoreapi.com/products`
- **Endpoint**: `/top/Toko`
- **Rate Limit**: 3 requests per second, 60 requests per minute
- **Response Format**: JSON

## 📂 Struktur Proyek

```
responsi/
├── lib/
│   ├── main.dart                    # Entry point aplikasi
│   ├── models/
│   │   ├── Toko_model.dart         # Model data Toko dari API
│   │   ├── user_model.dart          # Model data user (Hive)
│   │   └── user_model.g.dart        # Generated Hive adapter
│   ├── services/
│   │   ├── api_service.dart         # Service untuk API calls (Jikan API)
│   │   ├── auth_service.dart        # Service autentikasi & registrasi
│   │   ├── favorites_service.dart   # Service manajemen favorites
│   │   └── profile_service.dart     # Service foto profil
│   └── pages/
│       ├── register_page.dart       # Halaman registrasi user
│       ├── login_page.dart          # Halaman login
│       ├── home_page.dart           # Halaman utama (list Toko)
│       ├── detail_page.dart         # Halaman detail Toko
│       ├── favorites_page.dart      # Halaman daftar favorit
│       └── profile_page.dart        # Halaman profile user
├── pubspec.yaml                     # Dependencies & assets
└── README.md                        # Dokumentasi proyek
```

## 🚀 Setup & Installation

### Prerequisites

- Flutter SDK (versi 3.0 atau lebih tinggi)
- Android Studio / VS Code dengan Flutter extension
- Android SDK atau iOS Simulator
- Git

### Langkah Instalasi

1. **Clone repository**

   ```bash
   git clone <repository-url>
   cd 124230093-Responsi-Prak-Mobile/responsi
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate Hive adapters**

   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Jalankan aplikasi**

   ```bash
   # Untuk debug mode
   flutter run

   # Untuk release mode
   flutter run --release
   ```

### Troubleshooting

#### Error: Hive adapter not found

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

#### Error: API tidak merespons

- Pastikan koneksi internet aktif
- Cek rate limit API Jikan (max 60 requests/minute)
- Tunggu beberapa saat jika terkena rate limit

#### Error: Image picker tidak bekerja

- Tambahkan permission di `AndroidManifest.xml`:
  ```xml
  <uses-permission android:name="android.permission.CAMERA"/>
  <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
  ```
- Untuk iOS, tambahkan di `Info.plist`:
  ```xml
  <key>NSCameraUsageDescription</key>
  <string>Aplikasi membutuhkan akses kamera untuk foto profil</string>
  <key>NSPhotoLibraryUsageDescription</key>
  <string>Aplikasi membutuhkan akses galeri untuk foto profil</string>
  ```

## 💡 Code Quality & Best Practices

- ✅ **Clean Code**: Kode terstruktur dengan baik, mudah dibaca dan dipahami
- ✅ **No Dead Code**: Tidak ada kode yang tidak digunakan
- ✅ **Separation of Concerns**: Model, Service, dan UI terpisah dengan jelas
- ✅ **Error Handling**: Penanganan error pada API calls dan input validation
- ✅ **Best Practices**:
  - Menggunakan `const` constructor untuk optimasi performa
  - Proper state management dengan `StatefulWidget`
  - Async/await untuk operasi asynchronous
  - Responsive UI dengan `MediaQuery`
  - Clean architecture (Model-Service-View)

## 📝 Cara Penggunaan

1. **Registrasi Akun**

   - Buka aplikasi dan klik "Register"
   - Isi username dan password (wajib)
   - Isi nama lengkap dan NIM (opsional)
   - Klik tombol Register

2. **Login**

   - Masukkan username dan password yang sudah didaftarkan
   - Klik Login
   - Aplikasi akan mengingat sesi login Anda

3. **Menjelajah Toko**

   - Scroll untuk melihat daftar top Toko
   - Pull down untuk refresh data
   - Klik card Toko untuk melihat detail

4. **Menambah Favorit**

   - Buka detail Toko
   - Klik icon heart untuk menambah/menghapus favorit
   - Lihat semua favorit di tab Favorites

5. **Mengatur Profile**
   - Buka tab Profile
   - Klik tombol kamera untuk upload foto dari kamera/galeri
   - Foto akan tersimpan dan ditampilkan setiap kali membuka aplikasi

## 📸 Screenshots

> _Tambahkan screenshot aplikasi di sini untuk dokumentasi yang lebih baik_

## 🤝 Kontribusi

Proyek ini dibuat untuk keperluan akademik. Saran dan masukan dapat disampaikan melalui issues atau pull requests.

## 📄 License

This project is created for educational purposes as part of Mobile Programming practicum.

## 👨‍💻 Developer

- **NIM**: 124230093
- **Mata Kuliah**: Praktikum Pemrograman Mobile
- **Universitas**: [Nama Universitas]

---

**Dibuat dengan ❤️ menggunakan Flutter**
