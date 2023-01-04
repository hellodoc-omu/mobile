import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/user_avatar.dart';

class PatientScreenSeenByDoctor extends StatefulWidget {
  const PatientScreenSeenByDoctor({super.key});

  @override
  State<PatientScreenSeenByDoctor> createState() =>
      _PatientScreenSeenByDoctor();
}

class _PatientScreenSeenByDoctor extends State<PatientScreenSeenByDoctor> {
  @override
  Widget build(BuildContext context) {
    Widget profil(String name, String mail) {
      return Column(
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
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomButton(
              onTap: () {},
              innerText: "Mesaj Gönder",
              bgColor: Colors.white,
              innerTextColor: Colors.black45,
              innerTextSize: 12,
              innerTextPaddingV: 8,
            ),
          ),
        ],
      );
    }

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
          'Hasta',
        ),
      ),
      backgroundColor: colors["primary"],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [profil('Berkay Gebeş', 'berkay.gebes@gmail.com')],
      ),
    );
  }
}
