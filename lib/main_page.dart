import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
        BottomNavigationBarItem(activeIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(activeIcon: Icon(Icons.person), icon: Icon(Icons.person_outline), label: "Profile"),
        BottomNavigationBarItem(activeIcon: Icon(Icons.settings), icon: Icon(Icons.settings_outlined), label: "Settings"),
      ],
      ),
      body: SafeArea(child: Placeholder()),
    );
  }
}