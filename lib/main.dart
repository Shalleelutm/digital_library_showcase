import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ELibraryApp());
}

class ELibraryApp extends StatelessWidget {
  const ELibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Library Showcase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const WelcomeScreen(),
        'home': (_) => const HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}
