import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';

Widget header(String name, String email) {
  return SizedBox(
    height: 150,
    child: UserAccountsDrawerHeader(
        arrowColor: Colors.white,
        accountName: Text(
          name,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        accountEmail: Text(
          email,
          style: const TextStyle(color: Colors.black54),
        ),
        currentAccountPicture: Icon(
          Icons.circle_rounded,
          color: colors["primary"],
          size: 50,
        ),
        decoration: const BoxDecoration(color: Colors.white)),
  );
}
