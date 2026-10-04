#Algorithm
Algoritma menjelaskan urutan langkah yang dilakukan sistem untuk menyelesaikan masalah.

A.Algoritma Peminjaman Buku
1. Terima ID anggota dan ID buku.
2. Cari anggota berdasarkan ID.
3. Jika anggota tidak ditemukan, tampilkan "Anggota tidak ditemukan".
4. Hitung jumlah buku yang sedang dipinjam anggota.
5. Jika jumlah buku sudah 3 atau lebih, tampilkan "Maksimal 3 buku".
6. Cari buku berdasarkan ID.
7. Jika buku tidak ditemukan, tampilkan "Buku tidak ditemukan".
8. Cek status buku.
9. Jika buku sedang dipinjam, tampilkan "Buku sedang dipinjam".
10. Jika semua validasi berhasil:
    a. Ubah status buku menjadi borrowed.
    b. Tambahkan buku ke daftar pinjaman anggota.
    c. Simpan data peminjaman.
11. Tampilkan "Peminjaman berhasil".

B.Algoritma Pengembalian Buku
1. Terima ID anggota dan ID buku.
2. Cari data peminjaman.
3. Tentukan tanggal pengembalian.
4. Bandingkan tanggal pengembalian dengan tanggal jatuh tempo.
5. Jika tanggal pengembalian melewati jatuh tempo:
    a. Hitung jumlah hari keterlambatan.
    b. Hitung denda dengan rumus:
       jumlah hari keterlambatan × Rp1.000.
6. Ubah status buku menjadi available.
7. Hapus buku dari daftar pinjaman anggota.
8. Tampilkan hasil pengembalian dan jumlah denda.