import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/buttoned_text.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/logo.dart';
import 'package:hellodoc/widgets/textbox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var bottomTexts = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonedText(onTap: () {}, innerText: "Şifremi unuttum"),
        ButtonedText(onTap: () {}, innerText: "Hesabınız yok mu?"),
      ],
    );

    var form = Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Textbox(
            hintText: "E-posta adresiniz",
            controller: emailController,
            validator: (v) => null,
          ),
          const SizedBox(height: 16),
          Textbox(
            hintText: "Parolanız",
            obscureText: true,
            controller: passwordController,
            validator: (v) => null,
          ),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {},
            innerText: "Giriş Yap",
            fitWidth: true,
          ),
          const SizedBox(height: 16),
          bottomTexts,
        ],
      ),
    );

    return Scaffold(
      backgroundColor: colors["secondary"],
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: size.height / 2,
              child: Center(child: Logo.square(width: 256)),
            ),
            SizedBox(
              height: size.height / 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: form,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
