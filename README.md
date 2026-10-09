# Manajemen Usaha PET Botol — Online

## Isi paket
- `index.html`: aplikasi dengan login Supabase dan sinkronisasi data online.
- `config.js`: URL proyek dan publishable key untuk proyek Supabase Botol PETku.
- `supabase.sql`: tabel database dan kebijakan akses.

## Setup
1. Di Supabase project `Botol PETku`, buka SQL Editor. Jika skrip sebelumnya sudah berhasil dijalankan, tabel dan policy kemungkinan sudah ada; skrip ini memakai `if not exists` dan `drop policy if exists`, sehingga dapat dijalankan ulang untuk menyamakan policy.
2. Pastikan Authentication mengizinkan login email/password dan nonaktifkan public signups jika hanya admin yang boleh membuat akun.
3. Buat akun login dari Supabase Authentication > Users (Add user). Jangan membagikan password melalui chat.
4. Upload ketiga file ini ke root satu repository GitHub.
5. Di Vercel, import repository tersebut dan deploy sebagai static site. Tidak perlu build command.
6. Buka URL Vercel dan login menggunakan akun yang dibuat di Supabase.

## Keamanan dan data
- `config.js` berisi publishable key, bukan secret/service_role key. Jangan pernah menaruh secret/service_role key di frontend.
- Kebijakan database mengizinkan semua pengguna yang telah login mengakses dataset bersama. Buat akun hanya untuk orang tepercaya.
- Dataset disimpan dalam satu baris JSON; perubahan hampir bersamaan dari beberapa perangkat dapat saling menimpa. Ekspor CSV sebagai backup secara berkala.
- Sebelum dipakai untuk pencatatan utama, uji login, tambah transaksi, refresh halaman, dan akses dari perangkat lain.


## Mode tanpa login (uji coba)
Aplikasi ini tidak meminta akun login. Jalankan ulang `supabase.sql` di SQL Editor untuk mengaktifkan akses anon. **Peringatan:** semua orang yang mengetahui URL aplikasi/proyek dapat membaca, menimpa, atau menghapus data usaha. Jangan gunakan untuk data sensitif atau produksi; aktifkan kembali autentikasi dan kebijakan akses terbatas sebelum dipakai sungguhan.
