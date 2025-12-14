import 'package:example/features/home/presentation/home_page.dart';
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
        BottomNavigationBarItem(activeIcon: Icon(Icons.favorite), icon: Icon(Icons.favorite_border_outlined), label: "Favorites"),
        BottomNavigationBarItem(activeIcon: Icon(Icons.settings), icon: Icon(Icons.settings_outlined), label: "Settings"),
      ],
      ),
      body: SafeArea(child: HomePage()),
    );
  }
}