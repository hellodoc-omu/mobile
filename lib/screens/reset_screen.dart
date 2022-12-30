import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/logo.dart';
import 'package:hellodoc/widgets/textbox.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreen();
}

class _ResetScreen extends State<ResetScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState>? formKey = GlobalKey<FormState>();

    final emailController = TextEditingController();

    var logoSection = SizedBox(
      height: size.height / 2,
      child: Center(
        child: Logo.square(width: 256),
      ),
    );

    var textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    var form = Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Sıfırlama bağlantısı gönder",
            style: textStyle,
          ),
          const SizedBox(height: 64),
          Textbox(
            controller: emailController,
            validator: (v) => null,
            hintText: "E-posta adresiniz",
          ),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {},
            innerText: "Sıfırla",
            fitWidth: true,
          )
        ],
      ),
    );

    var formSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      height: size.height / 2,
      child: Center(child: form),
    );

    return Scaffold(
      backgroundColor: colors["secondary"],
      body: Center(
        child: ListView(
          children: [
            logoSection,
            formSection,
          ],
        ),
      ),
    );
  }
}
