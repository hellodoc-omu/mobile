import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';

Widget listTile(String text, IconData icon) {
  return ListTile(
    leading: Icon(
      icon,
      color: colors["primary"],
    ),
    title: Text(text, style: const TextStyle(fontSize: 20)),
    onTap: () {},
  );
}
