import 'package:flutter/material.dart';
import '../models/comic.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final List<Comic> comics = [
    Comic(
      title: 'Boku no Hero Academia',
      category: 'Manga',
      description:
          'Boku no Hero Academia adalah manga shōnen Jepang karya Kōhei Horikoshi tentang seorang anak laki-laki tanpa kekuatan super yang bercita-cita menjadi pahlawan.',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/147/147144.png',
      color: '0xFFFFEB3B', // kuning
    ),
    Comic(
      title: 'Jujutsu Kaisen',
      category: 'Manga',
      description:
          'Jujutsu Kaisen adalah manga shōnen Jepang karya Gege Akutami yang mengikuti Yuji Itadori dalam petualangannya melawan kutukan.',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/147/147144.png',
      color: '0xFF2196F3', // biru
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("YourName's Comic Books")),
      body: ListView.builder(
        itemCount: comics.length,
        itemBuilder: (context, index) {
          final comic = comics[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(comic.imageUrl),
            ),
            title: Text(comic.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPage(comic: comic)),
              );
            },
          );
        },
      ),
    );
  }
}
