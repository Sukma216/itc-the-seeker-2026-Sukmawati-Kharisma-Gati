import 'package:flutter/material.dart';
import 'tampilan/homescreen.dart'; 

void main() {
  runApp(const ITCDirectoryApp());
}

class ITCDirectoryApp extends StatelessWidget {
  const ITCDirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITC Directory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B5E20)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}