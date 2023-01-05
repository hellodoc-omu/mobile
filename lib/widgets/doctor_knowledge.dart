import 'package:flutter/material.dart';

Widget doctorCard(
    String hospital, String faculty, String major, String profession) {
  return SizedBox(
    child: Card(
      color: Colors.white,
      child: ListView(
        children: [
          ListTile(
            title: const Text('Bulunduğu Hastane/Klinik'),
            subtitle: Text(hospital),
          ),
          ListTile(
            title: const Text('Mezun Olduğu Fakülte'),
            subtitle: Text(faculty),
          ),
          ListTile(
            title: const Text('Ana Bilim Dalı'),
            subtitle: Text(major),
          ),
          ListTile(
            title: const Text('Uzmanlıklar'),
            subtitle: Text(profession),
          )
        ],
      ),
    ),
  );
}
