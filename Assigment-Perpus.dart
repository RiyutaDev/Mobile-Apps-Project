// =============================================
// Assigment - Perpustakaan
// Nama : RIZKI RIANA PUTRA
// NIM  : 1124160241
// KELAS : TI 24 SE SHIFT
// =============================================


// ---------- ABSTRACTION ----------

// BR-02:
// Status buku hanya dapat berupa available atau borrowed.
enum BookStatus {
  available,
  borrowed,
}


// Class untuk menyimpan data anggota perpustakaan.
class Member {
  String id;
  String name;
  List<String> borrowedBooks;

  Member({
    required this.id,
    required this.name,
    List<String>? borrowedBooks,
  }) : borrowedBooks = borrowedBooks ?? [];
}


// Class untuk menyimpan data buku.
class Book {
  String id;
  String title;
  BookStatus status;

  Book({
    required this.id,
    required this.title,
    this.status = BookStatus.available,
  });
}


// Class untuk menyimpan data transaksi peminjaman.
class Borrowing {
  String memberId;
  String bookId;
  DateTime borrowDate;
  DateTime dueDate;

  Borrowing({
    required this.memberId,
    required this.bookId,
    required this.borrowDate,
    required this.dueDate,
  });
}


// ---------- DATA ----------

// Data anggota
final List<Member> members = [
  Member(
    id: 'M001',
    name: 'Sayyid',
  ),
  Member(
    id: 'M002',
    name: 'Hanip',
  ),
];


// Data buku
final List<Book> books = [
  Book(
    id: 'B001',
    title: 'Pemrograman Dart',
  ),
  Book(
    id: 'B002',
    title: 'Algoritma dan Struktur Data',
  ),
  Book(
    id: 'B003',
    title: 'Basis Data',
  ),
  Book(
    id: 'B004',
    title: 'Sistem Informasi',
  ),
  Book(
    id: 'B005',
    title: 'Pemrograman Web',
  ),
];


// Data transaksi peminjaman
final List<Borrowing> borrowings = [];


// ---------- DECOMPOSITION ----------


// Mencari anggota berdasarkan ID.
Member? findMember(String memberId) {
  for (var member in members) {
    if (member.id == memberId) {
      return member;
    }
  }

  return null;
}


// Mencari buku berdasarkan ID.
Book? findBook(String bookId) {
  for (var book in books) {
    if (book.id == bookId) {
      return book;
    }
  }

  return null;
}


// BR-01
// Menghitung jumlah buku yang sedang dipinjam anggota.
int countBorrowedBooks(String memberId) {
  final member = findMember(memberId);

  if (member == null) {
    return 0;
  }

  return member.borrowedBooks.length;
}


// BR-02
// Mengecek apakah buku tersedia untuk dipinjam.
//if statement yang lebih panjang//

// bool isBookAvailable(String bookId) {
//   final book = findBook(bookId);

//   if (book == null) {
//     return false;
//   }

//   return book.status == BookStatus.available;
// }

//if ternary nya yang singkat//
bool isBookAvailable(String bookId) {
  final book = findBook(bookId);

  return book?.status == BookStatus.available;
}

//Penjelasan singkat: saya menggunakan if untuk mengecek apakah book ditemukan. Karena hasil akhirnya hanya berupa true atau false, pengecekan itu bisa disederhanakan menjadi satu ekspresi boolean. Operator ?. digunakan supaya kalau book bernilai null, hasilnya otomatis false. ?. adalah null-aware operator, jadi sistem hanya mengecek status jika book ada. Kalau book tidak ditemukan (null), hasil perbandingannya otomatis false.”


// Menghitung denda keterlambatan.
// BR-03: Rp1.000 per hari keterlambatan.
//If statement yang lebih panjang//
// int calculateFine(DateTime dueDate, DateTime returnDate) {
//   if (!returnDate.isAfter(dueDate)) {
//     return 0;
//   }

//   final lateDays = returnDate.difference(dueDate).inDays;

//   return lateDays * 1000;
// }

//if ternary yang lebih singkat//
int calculateFine(DateTime dueDate, DateTime returnDate) {
  final lateDays = returnDate.difference(dueDate).inDays;

  return lateDays > 0 ? lateDays * 1000 : 0;
}

//penjelasan singkat: saya menggunakan if untuk mengecek apakah returnDate lebih besar dari dueDate. Karena hasil akhirnya hanya berupa jumlah denda (0 atau lateDays * 1000), pengecekan itu bisa disederhanakan menjadi satu ekspresi. Operator ? : digunakan untuk memilih antara dua nilai berdasarkan kondisi. Jika lateDays > 0, maka denda dihitung; jika tidak, denda = 0.


// ---------- ALGORITHM ----------


// Proses utama peminjaman buku.
//
// Urutan:
// 1. Cari anggota
// 2. Cek jumlah pinjaman
// 3. Cari buku
// 4. Cek ketersediaan buku
// 5. Simpan peminjaman
String borrowBook(
  String memberId,
  String bookId,
  DateTime borrowDate,
  DateTime dueDate,
) {
  // Cari anggota
  final member = findMember(memberId);

  if (member == null) {
    return 'Peminjaman ditolak: anggota tidak ditemukan.';
  }


  // BR-01
  // Anggota maksimal meminjam 3 buku.
  final borrowedCount = countBorrowedBooks(memberId);

  if (borrowedCount >= 3) {
    return 'Peminjaman ditolak: maksimal 3 buku.';
  }


  // Cari buku
  final book = findBook(bookId);

  if (book == null) {
    return 'Peminjaman ditolak: buku tidak ditemukan.';
  }


  // BR-02
  // Buku yang sedang dipinjam tidak dapat dipinjam kembali.
  if (!isBookAvailable(bookId)) {
    return 'Peminjaman ditolak: buku sedang dipinjam.';
  }


  // Simpan buku ke daftar pinjaman anggota.
  member.borrowedBooks.add(bookId);


  // Ubah status buku menjadi borrowed.
  book.status = BookStatus.borrowed;


  // Simpan transaksi peminjaman.
  borrowings.add(
    Borrowing(
      memberId: memberId,
      bookId: bookId,
      borrowDate: borrowDate,
      dueDate: dueDate,
    ),
  );


  return 'Peminjaman berhasil: ${book.title}.';
}


// Proses pengembalian buku.
String returnBook(
  String memberId,
  String bookId,
  DateTime returnDate,
) {
  final member = findMember(memberId);

  if (member == null) {
    return 'Pengembalian gagal: anggota tidak ditemukan.';
  }


  final book = findBook(bookId);

  if (book == null) {
    return 'Pengembalian gagal: buku tidak ditemukan.';
  }


  // Cari transaksi peminjaman.
  Borrowing? borrowing;

  for (var item in borrowings) {
    if (item.memberId == memberId &&
        item.bookId == bookId) {
      borrowing = item;
      break;
    }
  }


  if (borrowing == null) {
    return 'Pengembalian gagal: data peminjaman tidak ditemukan.';
  }


  // BR-03
  // Hitung denda berdasarkan keterlambatan.
  final fine = calculateFine(
    borrowing.dueDate,
    returnDate,
  );


  // Hapus buku dari daftar pinjaman anggota.
  member.borrowedBooks.remove(bookId);


  // Ubah status buku menjadi tersedia.
  book.status = BookStatus.available;


  // Hapus transaksi peminjaman.
  borrowings.remove(borrowing);

// Hasil akhir pengembalian buku, termasuk informasi denda jika ada.
//if statement yang lebih panjang//
//   if (fine > 0) {
//     return 'Pengembalian berhasil. Denda: Rp$fine.';
//   }


//   return 'Pengembalian berhasil. Tidak ada denda.';
// }

//if ternary yang lebih singkat//
return fine > 0
    ? 'Pengembalian berhasil. Denda: Rp$fine.'
    : 'Pengembalian berhasil. Tidak ada denda.';
}

//Penjelasan singkat: saya menggunakan if untuk mengecek apakah fine lebih besar dari 0. Karena hasil akhirnya hanya berupa string yang berbeda berdasarkan kondisi, pengecekan itu bisa disederhanakan menjadi satu ekspresi menggunakan operator ? :. Jika fine > 0, maka string yang menunjukkan denda dikembalikan; jika tidak, string yang menunjukkan tidak ada makan tidak ada denda nya.


// ---------- HELPER UNTUK TEST ----------

// Menampilkan status buku.
void showBookStatus(String bookId) {
  final book = findBook(bookId);

  if (book == null) {
    print('Buku tidak ditemukan.');
    return;
  }

  print(
    '${book.title} → ${book.status.name}',
  );
}


// Menampilkan jumlah buku yang sedang dipinjam anggota.
void showBorrowedCount(String memberId) {
  final member = findMember(memberId);

  if (member == null) {
    print('Anggota tidak ditemukan.');
    return;
  }

  print(
    '${member.name} sedang meminjam '
    '${countBorrowedBooks(memberId)} buku.',
  );
}


// ---------- TEST SCENARIO ----------

void main() {
  final today = DateTime(2026, 10, 4);
  final dueDate = DateTime(2026, 10, 11);


  // ==========================================
  // SKENARIO 1
  // Peminjaman berhasil
  // ==========================================

  print('===== SKENARIO 1 =====');

  print(
    borrowBook(
      'M001',
      'B001',
      today,
      dueDate,
    ),
  );

  // Expected:
  // Peminjaman berhasil: Pemrograman Dart.


  // ==========================================
  // SKENARIO 2
  // Gagal karena buku sedang dipinjam
  // BR-02
  // ==========================================

  print('\n===== SKENARIO 2 =====');

  print(
    borrowBook(
      'M002',
      'B001',
      today,
      dueDate,
    ),
  );

  // Expected:
  // Peminjaman ditolak: buku sedang dipinjam.


  // ==========================================
  // SKENARIO 3
  // Gagal karena maksimal 3 buku
  // BR-01
  // ==========================================

  print('\n===== SKENARIO 3 =====');

  // M001 sudah memiliki B001.
  // Tambahkan B002 dan B003.
  print(
    borrowBook(
      'M001',
      'B002',
      today,
      dueDate,
    ),
  );

  print(
    borrowBook(
      'M001',
      'B003',
      today,
      dueDate,
    ),
  );

  // Sekarang M001 memiliki 3 buku.
  // B004 harus ditolak.

  print(
    borrowBook(
      'M001',
      'B004',
      today,
      dueDate,
    ),
  );

  // Expected:
  // Peminjaman berhasil: Basis Data.
  // Peminjaman ditolak: maksimal 3 buku.


  // ==========================================
  // SKENARIO 4
  // Gagal karena anggota tidak ditemukan
  // ==========================================

  print('\n===== SKENARIO 4 =====');

  print(
    borrowBook(
      'M999',
      'B005',
      today,
      dueDate,
    ),
  );

  // Expected:
  // Peminjaman ditolak: anggota tidak ditemukan.


  // ==========================================
  // SKENARIO 5
  // Gagal karena buku tidak ditemukan
  // ==========================================

  print('\n===== SKENARIO 5 =====');

  print(
    borrowBook(
      'M002',
      'B999',
      today,
      dueDate,
    ),
  );

  // Expected:
  // Peminjaman ditolak: buku tidak ditemukan.


  // ==========================================
  // SKENARIO 6
  // Pengembalian terlambat
  // BR-03
  // ==========================================

  print('\n===== SKENARIO 6 =====');

  // B001 dipinjam M001.
  // Jatuh tempo: 11 Oktober
  // Dikembalikan: 14 Oktober
  // Terlambat 3 hari.
  // Denda = 3 × Rp1.000 = Rp3.000

  print(
    returnBook(
      'M001',
      'B001',
      DateTime(2026, 10, 14),
    ),
  );

  // Expected:
  // Pengembalian berhasil. Denda: Rp3000.


  // ==========================================
  // SKENARIO 7
  // Pengembalian tepat waktu
  // BR-03
  // ==========================================

  print('\n===== SKENARIO 7 =====');

  // M002 meminjam B005.
  print(
    borrowBook(
      'M002',
      'B005',
      today,
      dueDate,
    ),
  );

  // Dikembalikan sebelum batas waktu.
  print(
    returnBook(
      'M002',
      'B005',
      DateTime(2026, 10, 10),
    ),
  );

  // Expected:
  // Peminjaman berhasil: Pemrograman Web.
  // Pengembalian berhasil. Tidak ada denda.


  // ==========================================
  // INFORMASI AKHIR
  // ==========================================

  print('\n===== STATUS AKHIR =====');

  showBorrowedCount('M001');
  showBorrowedCount('M002');

  showBookStatus('B001');
  showBookStatus('B005');
}