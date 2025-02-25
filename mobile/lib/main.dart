import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart Flutter App',
      theme: ThemeData(
        primaryColor: Color(0xFF56021F), // Warna tombol
        scaffoldBackgroundColor: Color(0xFFFFDFEF), // Warna latar belakang
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF410038),
          foregroundColor: Colors.white,
        ),
      ),
      home: LoginPage(),
    );
  }
}
