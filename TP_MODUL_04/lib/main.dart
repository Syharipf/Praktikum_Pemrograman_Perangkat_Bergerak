import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const myApp(),
    );
  }
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Warna background AppBar putih 
        elevation: 2, // Memberi sedikit bayangan agar terlihat batasnya
        
        // BAGIAN 1: Teks di sebelah kiri
        // Menggunakan Column agar bisa membuat 2 baris teks seperti di gambar output
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Welcome,",
              style: TextStyle(
                color: Colors.deepPurple, // Warna ungu 
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "103022300094 - Syarif", // GANTI DENGAN NIM - NAMA KAMU
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
        
        // BAGIAN 2: CircleAvatar di sebelah kanan (trailing)
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Jarak dari pinggir kanan
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green, // Warna lingkaran hijau sesuai gambar
              // Kamu bisa menambahkan child: Icon atau Text jika diperlukan
            ),
          ),
        ],
      ),
      
      // BAGIAN 3: Container berwarna (Gradient) di tengah layar
      body: Center(
        child: Container(
          width: 150,  // Lebar kotak
          height: 150, // Tinggi kotak
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Membuat sudut agak tumpul
            gradient: const LinearGradient(
              // Membuat gradasi warna dari biru ke ungu/pink
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.purpleAccent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}