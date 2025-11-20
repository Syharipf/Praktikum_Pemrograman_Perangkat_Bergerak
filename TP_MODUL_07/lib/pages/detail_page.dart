import 'package:flutter/material.dart';
import '../models/comic.dart';

class DetailPage extends StatelessWidget {
  final Comic comic;

  const DetailPage({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(comic.color)),
      appBar: AppBar(
        title: Text(comic.title),
        backgroundColor: Color(int.parse(comic.color)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comic.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              comic.category,
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Text(comic.description, style: TextStyle(fontSize: 16)),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('KEMBALI'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
