import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/screens/login_screen.dart';
import 'package:hellodoc/widgets/logo.dart';

import '../utilities/utilities.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterDelay(context: context, nextPage: const LoginScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors["secondary"],
      body: Center(
        child: Logo.square(width: 256),
      ),
    );
  }
}
