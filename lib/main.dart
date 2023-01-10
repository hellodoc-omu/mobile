import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/screens/chat_screen.dart';
import 'package:hellodoc/screens/doctors_profile_seen_bypatient.dart';
import 'package:hellodoc/screens/help_details_screen.dart';
import 'package:hellodoc/screens/help_screen.dart';
import 'package:hellodoc/screens/notifications_screen.dart';
import 'package:hellodoc/screens/result_search_doctor_screen.dart';

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
      home: const NotificationsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
