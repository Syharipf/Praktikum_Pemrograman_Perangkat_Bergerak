import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView dengan Dialog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> appList = const [
    {
      "title": "Native App",
      "platform": "Android, iOS",
      "tech": "Java, Kotlin, Swift, C#",
      "color": "red",
    },
    {
      "title": "Hybrid App",
      "platform": "Android, iOS, Web",
      "tech": "JavaScript, Dart",
      "color": "purple",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView dengan Dialog'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: appList.length,
        itemBuilder: (context, index) {
          final app = appList[index];
          final color = app["color"] == "red" ? Colors.red : Colors.purple;

          return ListTile(
            leading: CircleAvatar(backgroundColor: color),
            title: Text(app["title"]!),
            subtitle: Text(app["platform"]!),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: const Text('Detail'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          app["title"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(app["platform"]!),
                        const SizedBox(height: 8),
                        Text(app["tech"]!),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Close",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
