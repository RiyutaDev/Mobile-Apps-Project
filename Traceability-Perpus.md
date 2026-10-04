# Bagian C — Traceability

Traceability digunakan untuk menunjukkan hubungan antara Business Rule,
implementasi fungsi dalam program, dan skenario pengujian.

## Tabel Traceability

| Business Rule | Function | Test Scenario | Expected Result |
|---|---|---|---|
| BR-01: Anggota maksimal meminjam 3 buku | `countBorrowedBooks()` + `borrowBook()` | Scenario 3 | Peminjaman buku ke-4 ditolak |
| BR-02: Buku yang sedang dipinjam tidak dapat dipinjam kembali | `isBookAvailable()` + `borrowBook()` | Scenario 2 | Peminjaman buku yang sedang dipinjam ditolak |
| BR-03: Denda Rp1.000 per hari keterlambatan | `calculateFine()` + `returnBook()` | Scenario 6 | Keterlambatan 3 hari menghasilkan denda Rp3.000 |

## Kesimpulan

Setiap Business Rule telah memiliki fungsi yang mengimplementasikan
aturan tersebut dan memiliki test scenario untuk membuktikan bahwa
aturan berjalan sesuai dengan ketentuan.