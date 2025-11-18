# Responsi - Shop App

Aplikasi mobile Flutter untuk menampilkan data anime dari API Jikan dengan fitur autentikasi, favorites, dan profile management.

## Fitur

### 1. Halaman Register
- Form registrasi dengan username dan password (wajib)
- Field tambahan: Nama Lengkap dan NIM (opsional)
- Validasi input
- Data user disimpan ke Hive (local database)
- Auto redirect ke halaman login setelah registrasi berhasil

### 2. Halaman Login
- Form login dengan username dan password
- Validasi kredensial dengan data Hive
- Session login disimpan ke SharedPreferences
- Auto login jika session masih aktif

### 3. Halaman Utama (Home)
- Menampilkan top anime dari API Jikan
- Grid view dengan poster, judul, dan rating
- Pull to refresh
- Navigasi ke halaman detail

### 4. Halaman Detail
- Informasi lengkap anime (poster, judul, score, sinopsis, episodes, status)
- Tombol favorite untuk menyimpan ke daftar favorit
- Icon favorite berubah warna saat diklik
- Data favorit disimpan ke SharedPreferences

### 5. Halaman Favorites
- Menampilkan daftar anime favorit
- Grid view dengan poster, judul, dan rating
- Badge favorite pada setiap card
- Navigasi ke halaman detail

### 6. Halaman Profile
- Menampilkan foto profil, nama, NIM, dan username
- Username diambil dari database Hive
- Tombol logout dengan konfirmasi
- **Fitur Kamera**: Ambil foto dari kamera atau galeri
- Foto profil disimpan ke SharedPreferences

## Teknologi yang Digunakan

- **Flutter SDK**: Framework UI
- **Hive**: Local database untuk menyimpan data user
- **SharedPreferences**: Menyimpan session login dan data favorit
- **HTTP**: Fetch data dari REST API
- **Image Picker**: Mengambil foto dari kamera/galeri
- **Jikan API**: Sumber data anime (https://api.jikan.moe/v4/top/anime)

## Struktur Proyek

```
lib/
├── main.dart                    # Entry point aplikasi
├── models/
│   ├── anime_model.dart         # Model data anime
│   ├── user_model.dart          # Model data user (Hive)
│   └── user_model.g.dart        # Generated Hive adapter
├── services/
│   ├── api_service.dart         # Service untuk API calls
│   ├── auth_service.dart        # Service autentikasi
│   ├── favorites_service.dart   # Service untuk favorites
│   └── profile_service.dart     # Service untuk profile photo
└── pages/
    ├── register_page.dart       # Halaman registrasi
    ├── login_page.dart          # Halaman login
    ├── home_page.dart           # Halaman utama
    ├── detail_page.dart         # Halaman detail anime
    ├── favorites_page.dart      # Halaman favorites
    └── profile_page.dart        # Halaman profile
```

## Setup & Installation

1. Clone repository
```bash
git clone <repository-url>
cd responsi
```

2. Install dependencies
```bash
flutter pub get
```

3. Generate Hive adapters
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run aplikasi
```bash
flutter run
```

## Code Quality

- **Clean Code**: Kode terstruktur dengan baik, mudah dibaca dan dipahami
- **No Dead Code**: Tidak ada kode yang tidak digunakan
- **Separation of Concerns**: Model, Service, dan UI terpisah dengan jelas
- **Error Handling**: Penanganan error pada API calls dan input validation
- **Best Practices**: Menggunakan const constructor, proper state management, dan async/await

## License

This project is created for educational purposes.
