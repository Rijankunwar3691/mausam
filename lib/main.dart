import 'package:flutter/material.dart';
import 'package:mausam/screens/home.dart';
import 'package:mausam/screens/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) =>  LoadingScreen(),
        '/home': (context) => const HomePage(),
        '/loading': (context) =>  LoadingScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
