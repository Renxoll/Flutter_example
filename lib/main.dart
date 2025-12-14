import 'package:example/features/auth/presentation/login_page.dart';
import 'package:example/features/auth/presentation/register_page.dart';
import 'package:example/core/ui/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MaterialTheme materialTheme = MaterialTheme(TextTheme());

    return MaterialApp(
   //   theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: LoginPage()),
      ),
    );
  }
}
