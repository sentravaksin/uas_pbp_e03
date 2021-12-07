# UAS PBP E03

This is repository of E03 Mid-term PBP task.
Contributors:
- Bornyto Hamonangan (2006486084)
- Luthmilla Sari Bhaskara (2006529505)
- Retadha Rumi Indika Hidayat (2006485314)
- Yusuf Zhafir Shadiq (2006483630)

## Cerita Aplikasi

Kami membuat aplikasi bernama Sentra Vaksin untuk pendataan vaksinasi masyarakat Indonesia. Aplikasi ini dapat digunakan oleh admin dan masyarakat umum (visitor). Pada Sentra Vaksin, informasi umum mengenai jadwal, lokasi, dan efek samping vaksinasi dapat diakses oleh admin dan visitor. Selain itu, ada beberapa informasi yang hanya dapat diakses oleh admin, yaitu daftar peserta yang ingin vaksin, daftar peserta yang sudah vaksin, serta daftar tenaga kesehatan.

## Modul yang Akan Diimplementasikan

1. **Informasi jadwal dan lokasi vaksinasi** (form (admin), list (visitor)) -- Bornyto Hamonangan (2006486084)

    Modul yang mengurus pendataan dan pemberitaan info vaksinasi yang tersedia. Modul mencakup:

        - Halaman berisi data vaksinasi yang akan diadakan. Data tersebut mencakup jenis vaksin, lokasi vaksin, jadwal vaksinasinya, dan kuota peserta.
        - Form untuk input data vaksinasi yang akan dilaksanakan. Form ini hanya bisa diakses admin.

2. **Lapor efek samping** (form (visitor), list (admin)) -- Retadha Rumi Indika Hidayat (2006485314)

    Modul yang mengurus pelaporan efek samping gejala vaksin. Modul mencakup :

        - Form untuk melaporkan efek samping vaksin, berisi nama, jenis vaksin, dan keluhan.
        - Halaman berisi data laporan yang masuk. Halaman ini hanya bisa diakses admin.

3. **Daftar peserta belum vaksin** (form (admin), list (admin)) -- Luthmilla Sari Bhaskara (2006529505)

    Modul yang mengurus pendaftaran peserta vaksin. Modul mencakup:

        - Form pendaftaran vaksin, berisi nama, dan bermacam screening kesehatan peserta sebelum melakukan vaksin.
        - Halaman berisi data pendaftar vaksin. Halaman ini hanya bisa diakses admin.

4. **Daftar tenaga kesehatan** (form (admin), list (admin)) -- Yusuf Zhafir Shadiq (2006483630)

    Modul yang mengurus pendaftaran tenaga kesehatan. Modul mencakup: 

        - Form pendaftaran tenaga kesehatan, berisi nama, asal RS, pendidikan.
        - Halaman berisi data tenaga kesehatan yang terdaftar. Halaman ini hanya bisa diakses admin.

## Persona dan Peran

1. **Admin:**

    Dapat mengakses (list):

        - Informasi jadwal & lokasi vaksinasi
        - Laporan efek samping
        - Daftar peserta belum vaksin
        - Daftar tenaga kesehatan

    Dapat menambahkan (form):

        - Informasi jadwal & lokasi vaksinasi
        - Daftar peserta belum vaksin
        - Daftar tenaga kesehatan

2. **Visitor:**

    Dapat mengakses (list):

        - Informasi jadwal & lokasi vaksinasi

    Dapat menambahkan (form):
    
        - Laporan efek samping
