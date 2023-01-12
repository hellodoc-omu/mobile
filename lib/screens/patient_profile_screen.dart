import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import '../widgets/profile.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreen();
}

class _PatientProfileScreen extends State<PatientProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(7),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: colors["primary"],
        title: const Text(
          'Profilim',
        ),
      ),
      backgroundColor: colors["primary"],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          profil('Berkay Gebeş', 'berkay.gebes@bil.omu.edu.tr'),
          Padding(
            padding: const EdgeInsets.only(top: 55.0, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomButton(
                  onTap: () {},
                  innerText: "Profilimi Güncelle",
                  bgColor: Colors.white,
                  innerTextColor: Colors.black45,
                  innerTextSize: 12,
                  innerTextPaddingV: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
