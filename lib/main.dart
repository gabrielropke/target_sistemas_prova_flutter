import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:target_teste/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Target Sistemas',
      theme: ThemeData(
        primarySwatch: Colors.green,
          textTheme: TextTheme(
            bodyMedium:
                GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
          ),
          primaryColor: Colors.green),
      home: const login_page(),
    );
  }
}
