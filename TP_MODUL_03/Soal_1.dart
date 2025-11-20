void main() {
  int A = 3; // jumlah baris
  int B = 2; // jumlah kolo

  // Membuat matriks kosong A x B
  List<List<int>> matrix = [];
  int count = 1;

  // Isi matriks dengan angka urut
  for (int i = 0; i < A; i++) {
    List<int> row = [];
    for (int j = 0; j < B; j++) {
      row.add(count);
      count++;
    }
    matrix.add(row);
  }

  // Tampilkan matriks
  print('Matriks A x B');
  print('A: $A');
  print('B: $B');
  print('Isi matriks:');
  for (var row in matrix) {
    print(row.join(' '));
  }

  // Buat transpose
  List<List<int>> transposed = [];
  for (int j = 0; j < B; j++) {
    List<int> row = [];
    for (int i = 0; i < A; i++) {
      row.add(matrix[i][j]);
    }
    transposed.add(row);
  }

  // Tampilkan hasil transpose
  print('\nHasil transpose:');
  for (var row in transposed) {
    print(row.join(' '));
  }
}
