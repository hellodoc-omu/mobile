import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/screens/reset_screen.dart';

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
      home: const ResetScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
