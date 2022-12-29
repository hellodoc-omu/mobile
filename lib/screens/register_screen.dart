import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/buttoned_text.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/logo.dart';
import 'package:hellodoc/widgets/textbox.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState>? formKey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordRController = TextEditingController();

    var logoSection = SizedBox(
      height: size.height / 2,
      child: Center(
        child: Logo.square(width: 256),
      ),
    );

    var bottomTextSection = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ButtonedText(
          onTap: () {},
          innerText: "Zaten bir hesabınız var mı?",
        ),
      ],
    );

    var form = Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Textbox(
            controller: emailController,
            validator: (v) => null,
            hintText: "E-posta adresiniz",
          ),
          const SizedBox(height: 16),
          Textbox(
            controller: passwordController,
            validator: (v) => null,
            hintText: "Parolanız",
          ),
          const SizedBox(height: 16),
          Textbox(
            controller: passwordRController,
            validator: (v) => null,
            hintText: "Parolanız",
          ),
          const SizedBox(height: 16),
          CustomButton(onTap: () {}, innerText: "İlerle"),
          const SizedBox(height: 16),
          bottomTextSection,
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
