String tentukanGrade(double nilai) {
  if (nilai >= 90) {
    return "A";
  } if (nilai >= 80) {
    return "B";
  } if (nilai >= 70) {
    return "C";
  }  if (nilai >= 60) {
    return "D";
  } 
    return "E";
  
}
void main() {
  print(tentukanGrade(65)); 
  
}