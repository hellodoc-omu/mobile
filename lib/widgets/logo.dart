// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Logo({
    super.key,
    this.height = 32,
    this.width = 32,
  });

  Logo.square({super.key, required this.width}) {
    height = width;
  }

  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
