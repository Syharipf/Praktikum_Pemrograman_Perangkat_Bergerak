import 'package:flutter/material.dart';
import '../../controller/http_controller.dart';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final titleC = TextEditingController();
  final descC = TextEditingController();
  final HttpController _http = HttpController();

  void saveData() async {
    if (titleC.text.isEmpty || descC.text.isEmpty) return;

    bool success = await _http.createUsers(titleC.text, descC.text);

    if (success) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Data Baru")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleC,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descC,
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: saveData, child: Text("Simpan")),
          ],
        ),
      ),
    );
  }
}
