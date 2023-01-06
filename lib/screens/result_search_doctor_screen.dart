import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/dListTile.dart';
import 'package:hellodoc/widgets/mListTile.dart';
import 'package:hellodoc/widgets/star_rating.dart';
import '../widgets/drawer/custom_drawer.dart';
import '../helpers/variable_breakpoints.dart';

class ResultSearchDoctorScreen extends StatefulWidget {
  const ResultSearchDoctorScreen({super.key});

  @override
  State<ResultSearchDoctorScreen> createState() => _ResultSearchDoctorScreen();
}

class _ResultSearchDoctorScreen extends State<ResultSearchDoctorScreen> {
  var array = [
    DoctorListTile(
      onTap: () {},
      titleText: 'Berkay Gebeş',
      subTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Dermotoloji'),
          stars(10, true),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.send,
          color: colors["primary"],
        ),
        onPressed: () {},
      ),
    ),
    DoctorListTile(
      onTap: () {},
      titleText: 'Esra Türk',
      subTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Kardiyoloji'),
          stars(10, true),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.send,
          color: colors["primary"],
        ),
        onPressed: () {},
      ),
    ),
    DoctorListTile(
      onTap: () {},
      titleText: 'Yunus Emre Türk',
      subTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Dermotoloji'),
          stars(10, true),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.send,
          color: colors["primary"],
        ),
        onPressed: () {},
      ),
      isOnline: true,
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Center(
        child: CustomButton(
          onTap: () {},
          innerText: 'Geri dön',
          innerTextSize: 14,
          innerTextPaddingV: 12,
          innerTextPaddingH: 17,
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors["primary"],
        title: const Text(
          'Aradığınız Doktorlar',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.black.withOpacity(0.1), thickness: 1);
        },
        itemBuilder: ((context, index) {
          return array[index];
        }),
        itemCount: array.length,
      ),
    );
  }
}
