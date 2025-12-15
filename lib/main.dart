import 'package:example/features/auth/presentation/login_page.dart';
import 'package:example/features/auth/presentation/register_page.dart';
import 'package:example/core/ui/theme.dart';
import 'package:example/features/home/presentation/home_page.dart'; // Importa HomePage
import 'package:example/features/home/presentation/blocs/destination_bloc.dart'; // Importa el BLoC
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Necesario para BlocProvider

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MaterialTheme materialTheme = MaterialTheme(TextTheme());

    return BlocProvider(
      create: (context) => DestinationBloc(), 
      child: MaterialApp(
        darkTheme: materialTheme.dark(),
        debugShowCheckedModeBanner: false,
        
      
        home: const Scaffold( 
          body: SafeArea(
            child: LoginPage(), 
          ),
        ),
        
      ),
    );
  }
}