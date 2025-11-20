import 'dart:io';

void CariAngka(int x) {
  List<List<int>> matrix = [
    [5, 10, 15],
    [2, 4, 6, 8],
    [1, 4, 9, 16, 25],
    [3, 4, 5, 6, 7, 8],
  ];

  bool found = false;

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      if (matrix[i][j] == x) {
        print("$x berada di baris ${i + 1}, kolom ${j + 1}");
        found = true;
      }
    }
  }

  if (!found) {
    print("$x tidak ditemukan.");
  }
}

void main() {
  stdout.write("Bilangan yang dicari: ");
  int x = int.parse(stdin.readLineSync()!);

  CariAngka(x);
}
