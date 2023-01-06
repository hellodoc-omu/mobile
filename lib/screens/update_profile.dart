import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/textbox.dart';
import 'package:hellodoc/widgets/user_avatar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreen();
}

class _UpdateProfileScreen extends State<UpdateProfileScreen> {
  GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  bool amIDoctor = false;

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    var screenTitle = const Text(
      "Profil Resmim",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );

    var photoSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const UserAvatar(),
        CustomButton(
          onTap: () {},
          innerText: "Yükle",
          bgColor: Colors.white,
          innerTextColor: primary,
          innerTextSize: 12,
          innerTextPaddingH: 20,
          innerTextPaddingV: 8,
        ),
      ],
    );

    var form = Form(
      key: formKey,
      child: Column(
        children: [
          Textbox(
            controller: TextEditingController(),
            validator: (v) => null,
            hintText: "İsminiz",
          ),
          const SizedBox(height: 10),
          Textbox(
            controller: TextEditingController(),
            validator: (v) => null,
            hintText: "Soyisminiz",
          )
        ],
      ),
    );

    var button = CustomButton(
      onTap: () {},
      innerText: amIDoctor ? "İleri" : "Güncelle",
      innerTextColor: primary,
      bgColor: Colors.white,
      fitWidth: true,
    );

    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView(
          children: [
            Center(child: screenTitle),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: photoSection,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 86),
              child: form,
            ),
            button
          ],
        ),
      ),
    );
  }
}
