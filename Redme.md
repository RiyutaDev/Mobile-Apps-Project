//
//Explicit Typing (Tanpa var):
//
void main() {
  String namaLaptop = 'ASUS ROG';
  int jumlahLaptop = 10;
  double hargaLaptop = 15000000.0;
  bool tersedia = true;

  // Nilai dapat diubah
  jumlahLaptop = 8;

  // Menampilkan data
  print('==============================');
  print('        DATA LAPTOP');
  print('==============================');
  print('Nama Laptop : $namaLaptop');
  print('Jumlah      : $jumlahLaptop');
  print('Harga       : Rp$hargaLaptop');
  print('Tersedia    : $tersedia');
  print('==============================');
}

//
//Sound Null Safety:
//
void main() {
  // Non-Nullable
  String namaMakanan = 'Nasi Uduk';

  print('Nama Makanan : $namaMakanan');

  // Nullable
  String? catatanPembeli;

  catatanPembeli = 'Jangan terlalu Banyak Sambelnya';

  print('Catatan      : $catatanPembeli');

  // Variabel boleh diisi null
  catatanPembeli = null;

  print('Catatan setelah diubah menjadi null : $catatanPembeli');

  // Null-Aware Operator (??)
  String catatanTampil =
      catatanPembeli ?? 'Tidak ada catatan dari pembeli';

  print('Catatan Tampil : $catatanTampil');

  // Null-Aware Access (?.)
  print('Catatan Kapital : ${catatanPembeli?.toUpperCase()}');
}

//
//final & Const dengan Tipe Eksplisit:
//
void main() {
  // FINAL
  // Nilainya ditentukan saat program berjalan dan hanya bisa diisi satu kali
  final String orderId = 'ORD-2026-001';
  final DateTime orderTime = DateTime.now();

  final String namaPelanggan = 'Rizky';
  final int nomorAntrian = 15;
  final String namaProduk = 'Asus ROG';

  // CONST
  // Nilainya sudah diketahui sejak compile-time dan tidak dapat diubah
  const String namaToko = 'Riyuta Store';
  const String mataUang = 'IDR';
  const double pajak = 0.11;

  print('==============================');
  print('       DATA PEMESANAN');
  print('==============================');

  print('Nama Toko      : $namaToko');
  print('Order ID       : $orderId');
  print('Waktu          : $orderTime');
  print('Nama Pelanggan : $namaPelanggan');
  print('Nomor Antrian  : $nomorAntrian');
  print('Nama Produk    : $namaProduk');

  print('------------------------------');
  print('Mata Uang      : $mataUang');
  print('Pajak          : ${pajak * 100}%');

  print('==============================');
}

//
//let modifier dengan final dan const:
//
void main() {
  // FINAL
  final String orderId = 'ORD-2026-001';
  final DateTime orderTime = DateTime.now();

  // CONST
  const String namaToko = 'Riyuta Store';
  const String mataUang = 'IDR';

  // LATE
  late String nomorStruk;

  // Nomor struk baru dibuat saat proses generate dijalankan
  nomorStruk = 'REC-${DateTime.now().millisecondsSinceEpoch}';

  print('==============================');
  print('       DATA PEMESANAN');
  print('==============================');
  print('Nama Toko : $namaToko');
  print('Order ID  : $orderId');
  print('Waktu     : $orderTime');
  print('No. Struk : $nomorStruk');
  print('Mata Uang : $mataUang');
  print('==============================');
}

//
//Daftar Type Data:
//
void main() {
  // ==============================
  // CONST
  // Data yang nilainya sudah pasti
  // ==============================
  const String namaToko = 'RIYUTA STORE';
  const String alamatToko = 'Tangerang';
  const double pajak = 0.11;
  const String mataUang = 'Rp';

  // ==============================
  // FINAL
  // Data hanya diisi satu kali
  // ==============================
  final String namaPembeli = 'Rizky';
  final String nomorTransaksi = 'TRX-2026-001';
  final DateTime waktuTransaksi = DateTime.now();

  // ==============================
  // DATA PRODUK
  // ==============================
  String namaProduk = 'ASUS ROG';
  int jumlahProduk = 1;
  double hargaProduk = 15000000.0;

  // ==============================
  // BOOL
  // Status pembayaran
  // ==============================
  bool pembayaranBerhasil = true;

  // ==============================
  // LATE
  // Nomor struk dibuat setelah data transaksi tersedia
  // ==============================
  late String nomorStruk;

  nomorStruk =
      'STRUK-${DateTime.now().millisecondsSinceEpoch}';

  // ==============================
  // LIST
  // Daftar produk yang dibeli
  // ==============================
  List<String> daftarProduk = [
    namaProduk,
  ];

  // ==============================
  // SET
  // Kategori produk
  // ==============================
  Set<String> kategoriProduk = {
    'Laptop',
    'Elektronik',
    'Laptop',
  };

  // ==============================
  // MAP
  // Data produk
  // ==============================
  Map<String, dynamic> dataProduk = {
    'nama': namaProduk,
    'harga': hargaProduk,
    'jumlah': jumlahProduk,
    'tersedia': true,
  };

  // ==============================
  // PERHITUNGAN
  // ==============================
  double subtotal = hargaProduk * jumlahProduk;
  double nilaiPajak = subtotal * pajak;
  double totalBayar = subtotal + nilaiPajak;

  // ==============================
  // STRUK PENJUALAN
  // ==============================
  print('==========================================');
  print('              $namaToko');
  print('           $alamatToko');
  print('==========================================');
  print('No. Transaksi : $nomorTransaksi');
  print('No. Struk     : $nomorStruk');
  print('Tanggal       : $waktuTransaksi');
  print('Pembeli       : $namaPembeli');
  print('------------------------------------------');

  print('Produk        : ${dataProduk['nama']}');
  print('Harga         : $mataUang${dataProduk['harga']}');
  print('Jumlah        : ${dataProduk['jumlah']}');
  print('Kategori      : $kategoriProduk');

  print('------------------------------------------');
  print('Subtotal      : $mataUang$subtotal');
  print('PPN 11%       : $mataUang$nilaiPajak');
  print('------------------------------------------');
  print('TOTAL BAYAR   : $mataUang$totalBayar');

  print('------------------------------------------');

  if (pembayaranBerhasil) {
    print('Status        : PEMBAYARAN BERHASIL');
  } else {
    print('Status        : PEMBAYARAN GAGAL');
  }

  print('==========================================');
  print('       Terima kasih, $namaPembeli!');
  print('          Selamat berbelanja');
  print('==========================================');
}