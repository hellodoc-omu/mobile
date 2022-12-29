import 'package:flutter/material.dart';
import 'package:hellodoc/screens/login_screen.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hellodoc',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: colors["primary"],
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
