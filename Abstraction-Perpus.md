##Abstraction
Abstraction digunakan untuk menentukan objek dan data penting yang benar-benar diperlukan oleh sistem, tanpa memasukkan detail yang tidak diperlukan.

#Class Member
Class Member digunakan untuk merepresentasikan anggota perpustakaan.
Atribut:
Member
├── id
├── name
└── borrowedBooks
Keterangan:
Atribut	Fungsi
id	Menyimpan ID anggota
name	Menyimpan nama anggota
borrowedBooks	Menyimpan daftar ID buku yang sedang dipinjam

#Class Book
Class Book digunakan untuk merepresentasikan buku.
Atribut:
Book
├── id
├── title
└── status
Keterangan:
Atribut	Fungsi
id	Identitas buku
title	Judul buku
status	Menunjukkan apakah buku tersedia atau sedang dipinjam.

#Class Borrowing
Class Borrowing digunakan untuk menyimpan data transaksi peminjaman.
Atribut:
Borrowing
├── memberId
├── bookId
├── borrowDate
└── dueDate
Keterangan:
Atribut	Fungsi
memberId	ID anggota yang meminjam
bookId	ID buku yang dipinjam
borrowDate	Tanggal mulai peminjaman
dueDate	Batas tanggal pengembalian

#Enum BookStatus
Enum digunakan untuk membatasi status buku agar hanya memiliki nilai yang valid.
BookStatus
├── available
└── borrowed
Keterangan:
- available → buku tersedia dan dapat dipinjam.
- borrowed → buku sedang dipinjam dan tidak dapat dipinjam kembali.

#Hubungan Abstraction
Member
  │
  │ melakukan
  ▼
Borrowing
  │
  │ mencatat
  ▼
Book
  │
  └── memiliki BookStatus