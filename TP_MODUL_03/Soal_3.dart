import 'dart:io';

int CariFPB(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

int CariKPK(int a, int b) {
  return (a * b) ~/ CariFPB(a, b);
}

void main() {
  stdout.write('Masukkan bilangan 1: ');
  int A = int.parse(stdin.readLineSync()!);

  stdout.write('Masukkan bilangan 2: ');
  int B = int.parse(stdin.readLineSync()!);

  int kpk = CariKPK(A, B);

  print('KPK $A dan $B = $kpk');
}
