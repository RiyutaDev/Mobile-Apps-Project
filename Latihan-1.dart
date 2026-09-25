void main() {
  // ==============================
  // DATA PRODUK
  // ==============================

  List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'nama': 'Nasi Uduk',
      'harga': 12000,
      'stok': 20,
      'tersedia': true,
    },
    {
      'id': 2,
      'nama': 'Mie Goreng',
      'harga': 15000,
      'stok': 10,
      'tersedia': true,
    },
    {
      'id': 3,
      'nama': 'Es Jeruk',
      'harga': 12000,
      'stok': 25,
      'tersedia': true,
    },
  ];

  // ==============================
  // KENA PAJAK 11%
  // ==============================

  const double taxRate = 0.11;

  // ==============================
  // DATA PEMBELI
  // ==============================

  String customerName = 'Rizki';

  String? customerNote;
  customerNote = 'Kurang manis';

  // ==============================
  // TRANSAKSI
  // ==============================

  final DateTime transactionTime = DateTime.now();

  final String transactionId =
      'TRX-${transactionTime.millisecondsSinceEpoch}';

  // Pilih produk Es Jeruk
  Map<String, dynamic> selectedProduct = products[2];

  // Jumlah pembelian
  int quantity = 2;

  // ==============================
  // HITUNG TOTAL PEMBAYARAN
  // ==============================

  double price =
      (selectedProduct['harga'] as num).toDouble();

  double subtotal = price * quantity;

  double tax = subtotal * taxRate;

  double total = subtotal + tax;

  // ==============================
  // OUTPUT STRUK PEMBELIAN
  // ==============================

  print('');
  print('======================================');
  print('          TOKO RIYUTA MART');
  print('======================================');

  print('No Transaksi : $transactionId');
  print('Tanggal      : $transactionTime');
  print('Pelanggan    : $customerName');

  print('--------------------------------------');

  print('Produk       : ${selectedProduct['nama']}');
  print('Harga        : Rp $price');
  print('Jumlah       : $quantity');
  print('Subtotal     : Rp $subtotal');

  print('--------------------------------------');

  print('PPN 11%      : Rp $tax');
  print('TOTAL        : Rp $total');

  print('--------------------------------------');

  print(
    'Catatan      : ${customerNote ?? 'Tidak ada catatan khusus'}',
  );

  print('Status       : ${selectedProduct['tersedia']}');

  print('======================================');
}