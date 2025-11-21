import 'package:flutter/material.dart';
import 'db_helper.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final result = await DBHelper().readItem();
    setState(() {
      data = result;
      isLoading = false;
    });
  }

  void showAddForm() {
    TextEditingController titleC = TextEditingController();
    TextEditingController descC = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Tambah Data Baru", style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              TextField(
                controller: titleC,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: descC,
                decoration: InputDecoration(labelText: "Description"),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                child: Text("Save"),
                onPressed: () async {
                  await DBHelper().addItem(titleC.text, descC.text);
                  Navigator.pop(context);
                  loadData();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TP MOD 10 - SQLite"), centerTitle: true),

      floatingActionButton: FloatingActionButton(
        onPressed: showAddForm,
        child: Icon(Icons.add),
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : data.isEmpty
          ? Center(child: Text("Belum ada data, wak 🙂"))
          : ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: data.length,
              itemBuilder: (_, i) {
                return Card(
                  child: ListTile(
                    title: Text(data[i]["title"]),
                    subtitle: Text(
                      "${data[i]["description"]}\n${data[i]["created_at"]}",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
