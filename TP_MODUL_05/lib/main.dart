import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeAreaPageViewApp(),
    );
  }
}

class SafeAreaPageViewApp extends StatefulWidget {
  const SafeAreaPageViewApp({super.key});

  @override
  State<SafeAreaPageViewApp> createState() => _SafeAreaPageViewAppState();
}

class _SafeAreaPageViewAppState extends State<SafeAreaPageViewApp> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          SafeArea(
            child: Center(
              child: Text(
                "Page 1",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Center(child: Text("Page 2", style: TextStyle(fontSize: 20))),
          Center(child: Text("Page 3", style: TextStyle(fontSize: 20))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Page 1"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Page 2"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Page 3"),
        ],
      ),
    );
  }
}
