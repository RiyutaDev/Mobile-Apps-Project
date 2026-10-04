void cetakJadwalHari(String hari) {

  

// switch yang lebih pendek//
  switch (hari) {
    case "Sabtu":
      print("Hari Kuliah Pengganti");
      break;

    case "Minggu":
      print("Hari libur");
      break;

    default:
      print("Hari kuliah");
  }
}

String cetakKeteranganGrade(String grade) {

  // String keterangan = "";

  // switch (grade) {
  //   case "A":
  //     keterangan = "Sangat Baik";
  //     break;
  //   case "B":
  //     keterangan = "Baik";
  //     break;
  //   case "C":
  //     keterangan = "Cukup";
  //     break;
  //   case "D":
  //     keterangan = "Kurang";
  //     break;
  //   default:
  //     keterangan = "Tidak Lulus";
  // }

  // switch yang lebih pendek//
  String keterangan = switch (grade) {
    'A' => "Sangat Baik",
    'B' => "Baik",
    'C' => "Cukup",
    'D' => "Kurang",
    _ => "Tidak Lulus"
  };

  return keterangan;
}

// case temenya adalah default, maka akan mengeksekusi default, dan tidak akan mengeksekusi case yang lain.

void main() {
  cetakJadwalHari("Sabtu");
  print(cetakKeteranganGrade("A"));
}