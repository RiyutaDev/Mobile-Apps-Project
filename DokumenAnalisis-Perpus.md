1. Problem Statement
Perpustakaan membutuhkan sistem peminjaman buku yang dapat memastikan setiap proses peminjaman mengikuti aturan yang telah ditentukan.
Sistem harus dapat memvalidasi jumlah buku yang sedang dipinjam oleh anggota, memastikan buku yang akan dipinjam masih tersedia, serta menghitung denda apabila buku dikembalikan melewati batas waktu yang telah ditentukan.
Tujuan Sistem
Sistem dibuat untuk:
1. Mengontrol jumlah buku yang sedang dipinjam setiap anggota.
2. Mencegah buku yang sedang dipinjam dipinjam kembali.
3. Menghitung denda keterlambatan secara otomatis.
4. Memberikan hasil proses peminjaman atau pengembalian dengan jelas.
Business Rule Utama
- Anggota maksimal meminjam 3 buku.
- Buku yang sedang dipinjam tidak dapat dipinjam kembali.
- Denda keterlambatan adalah Rp1.000 per hari.


2. Actor
Actor Utama: Anggota Perpustakaan
Anggota perpustakaan merupakan pihak yang menggunakan sistem untuk melakukan proses peminjaman dan pengembalian buku.
Aktivitas anggota meliputi:
- Meminjam buku.
- Mengembalikan buku.
- Melihat status peminjaman.
- Mengetahui jumlah buku yang sedang dipinjam.
- Mengetahui denda apabila terjadi keterlambatan.
Peran Sistem
Sistem perpustakaan bertugas:
- Memvalidasi data anggota.
- Memeriksa jumlah buku yang sedang dipinjam.
- Memeriksa ketersediaan buku.
- Mencatat transaksi peminjaman.
- Memproses pengembalian.
- Menghitung denda keterlambatan.

3. Input & Output
3.1 Input
data yang dibutuhkan sistem untuk menjalankan proses peminjaman dan pengembalian.
Input	            Keterangan
-memberId	    -ID anggota perpustakaan
-bookId	        -ID buku yang akan dipinjam atau dikembalikan
-borrowDate	    -Tanggal buku mulai dipinjam
-dueDate	    -Batas maksimal pengembalian buku
-returnDate	    -Tanggal buku dikembalikan

3.2 Output
hasil yang diberikan sistem setelah proses dilakukan.
-Output	                    Keterangan
-Peminjaman berhasil	    -Seluruh business rule terpenuhi
-Anggota tidak ditemukan	-ID anggota tidak terdaftar
-Maksimal 3 buku	        -Aggota sudah memiliki 3 buku yang sedang dipinjam
-Buku tidak ditemukan	    -ID buku tidak ditemukan
-Buku sedang dipinjam	    -Buku tidak tersedia untuk dipinjam
-Pengembalian berhasil	    -Buku berhasil dikembalikan
-Denda	                    -Jumlah denda berdasarkan hari keterlambatan

#Contoh Output
-Peminjaman berhasil: Berhasil
-Peminjaman ditolak: maksimal 3 buku.
-Peminjaman ditolak: buku sedang dipinjam.
-Denda keterlambatan: Rp3.000

4. Functional Requirement
Beberapa fungsi yang harus tersedia pada sistem.
Kode	Functional Requirement
FR-01	Sistem dapat melakukan proses peminjaman buku.
FR-02	Sistem dapat mencari dan memvalidasi anggota berdasarkan ID.
FR-03	Sistem dapat menghitung jumlah buku yang sedang dipinjam anggota.
FR-04	Sistem dapat mengecek status ketersediaan buku.
FR-05	Sistem dapat mencatat data peminjaman buku.
FR-06	Sistem dapat melakukan proses pengembalian buku.
FR-07	Sistem dapat menghitung denda berdasarkan jumlah hari keterlambatan.
FR-08	Sistem dapat menampilkan hasil proses peminjaman atau pengembalian.

5. Business Rules
aturan bisnis yang wajib dipenuhi oleh sistem.
Kode	        Business Rule	                    Keterangan
-BR-01	    
+Anggota maksimal meminjam 3 buku.	
+Jika anggota sudah memiliki 3 buku yang sedang dipinjam, peminjaman berikutnya ditolak.
-BR-02	    
+Buku yang sedang dipinjam tidak dapat dipinjam kembali.	
+Buku harus dikembalikan terlebih dahulu sebelum dapat dipinjam kembali.
-BR-03	    
+Denda sebesar Rp1.000 per hari keterlambatan.	
+Jika pengembalian melewati tanggal jatuh tempo, denda dihitung berdasarkan jumlah hari keterlambatan.

#Contoh BR-01
Jika anggota sudah meminjam:
-Buku 1
-Buku 2
-Buku 3
maka anggota tidak boleh meminjam buku ke-4 //Jumlah pinjaman = 3 dan Hasil = Ditolak//

#Contoh BR-02
Jika status buku adalah: Dipinjam
maka buku tidak dapat dipinjam oleh anggota lain atau dipinjam kembali sampai proses pengembalian dilakukan.

#Contoh BR-03
Jika:
Tanggal jatuh tempo : 10 Oktober
Tanggal kembali     : 13 Oktober
maka:
Hari keterlambatan = 3 hari

Denda = 3 × Rp1.000 = Rp3.000

