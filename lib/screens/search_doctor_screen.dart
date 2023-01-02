import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/drawer/custom_drawer.dart';
import '../helpers/variable_breakpoints.dart';
import '../widgets/logo.dart';

class SearchDoctorScreen extends StatefulWidget {
  const SearchDoctorScreen({super.key});

  @override
  State<SearchDoctorScreen> createState() => _SearchDoctorScreen();
}

class _SearchDoctorScreen extends State<SearchDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colors["primary"],
      appBar: AppBar(
        backgroundColor: colors["primary"],
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: size.height / 2,
              child: Center(child: Logo.square(width: 230)),
            ),
          ],
        ),
      ),
    );
  }
}
