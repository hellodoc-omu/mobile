import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/star_rating.dart';

var lastMeets = [
  {
    'anaBilimDali': 'Cilt Hastalıkları',
    'tarih': '27/12/2022',
  },
  {
    'anaBilimDali': 'Cilt Hastalıkları',
    'tarih': '26/12/2022',
  }
];

String? major = lastMeets[0]['anaBilimDali'];
String? date = lastMeets[0]['tarih'];
String? major2 = lastMeets[1]['anaBilimDali'];
String? date2 = lastMeets[1]['tarih'];

Widget meetingCard() {
  return SizedBox(
    child: Card(
      color: Colors.white,
      child: ListView(
        children: [
          ListTile(
            title: Text(major!),
            trailing: CustomButton(
              onTap: () {},
              innerText: 'Değerlendir',
              bgColor: Colors.white,
              innerTextColor: Colors.black45,
              innerTextSize: 12,
              innerTextPaddingV: 8,
            ),
            subtitle: Text(date!),
          ),
          ListTile(
            title: Text(major2!),
            trailing: stars(15, false),
            subtitle: Text(date2!),
          ),
          ListTile(
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: CustomButton(
                  onTap: () {},
                  innerText: 'Tümünü Gör',
                  bgColor: Colors.white,
                  innerTextColor: Colors.black45,
                  innerTextSize: 12,
                  innerTextPaddingV: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
