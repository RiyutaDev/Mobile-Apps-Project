void cetakStatusUsia(int usia) {
   // String status = "";

  // if (usia < 0) {
  //   print("Usia tidak valid");
  // } if (usia < 13) {
  //   print("Anak-anak");
  // } if (usia < 20) {
  //   print("Remaja");
  // }  if (usia < 60) {
  //   print("Dewasa");
  // } 
  //   print("Lansia");

  // if ternary yang lebih pendek//
  String status = usia >= 17 ? "Dewasa" : "Anak-anak";
  print(status);
}

void main() {
  cetakStatusUsia(20);
}