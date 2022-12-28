import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Logo.square(width: 128),
        ),
      ),
    );
  }
}
