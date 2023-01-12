import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/screens/doctor_mscreen.dart';

import 'package:hellodoc/screens/make_assessment_screen.dart';
import 'package:hellodoc/screens/messages_screen.dart';

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
        appBarTheme: AppBarTheme(color: colors["primary"], elevation: 0),
      ),

      home: const MakeAssessmentScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}