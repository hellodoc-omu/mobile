import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/user_avatar.dart';

Widget profil(String name, String mail) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const UserAvatar(),
      Text(
        name,
        style: const TextStyle(fontSize: 30, color: Colors.white),
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          mail,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    ],
  );
}
