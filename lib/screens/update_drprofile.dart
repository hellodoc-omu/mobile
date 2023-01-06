import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/ac_textbox.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/textbox.dart';

class UpdateDrProfileScreen extends StatefulWidget {
  const UpdateDrProfileScreen({super.key});

  @override
  State<UpdateDrProfileScreen> createState() => _UpdateDrProfileScreen();
}

class _UpdateDrProfileScreen extends State<UpdateDrProfileScreen> {
  GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    var screenTitle = const Text(
      "Doktor Bilgileri",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );

    var form = Form(
      key: formKey,
      child: Column(
        children: [
          AutoCompleteTextbox(
            options: const [],
            onSelected: (String v) {},
            hintText: "Mezun olduğunuz fakülte",
          ),
          const SizedBox(height: 10),
          AutoCompleteTextbox(
            options: const [],
            onSelected: (String v) {},
            hintText: "Ana bilim dalınız",
          ),
          const SizedBox(height: 10),
          Textbox(
            controller: TextEditingController(),
            validator: (String? v) => null,
            hintText: "Bulunduğunuz hastane veya klinik",
          ),
        ],
      ),
    );

    var button = CustomButton(
      onTap: () {},
      innerText: "Güncelle",
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
              padding: const EdgeInsets.symmetric(vertical: 64),
              child: form,
            ),
            button
          ],
        ),
      ),
    );
  }
}
