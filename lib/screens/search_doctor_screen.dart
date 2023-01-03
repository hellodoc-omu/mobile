import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/ac_textbox.dart';
import 'package:hellodoc/widgets/custom_button.dart';
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
            SizedBox(
              height: size.height / 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: ListView(
                    children: [
                      AutoCompleteTextbox(
                        options: const [],
                        onSelected: (String value) {},
                        hintText: "Ana bilim dalı seçiniz",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: AutoCompleteTextbox(
                          options: const [],
                          onSelected: (String value) {},
                          hintText: "Uzmanlık alanı seçiniz",
                        ),
                      ),
                      AutoCompleteTextbox(
                        options: const [],
                        onSelected: (String value) {},
                        hintText: "Doktor ismi ile ara...",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: CustomButton(
                          onTap: () {},
                          innerText: "Doktor Ara",
                          fitWidth: true,
                          isActive: false,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
