import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/screens/login_screen.dart';
import 'package:hellodoc/screens/register_screen2.dart';
import 'package:hellodoc/widgets/buttoned_text.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/logo.dart';
import 'package:hellodoc/widgets/textbox.dart';
import 'package:hellodoc/screens/hasta.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController sifrecontroller = TextEditingController();
  TextEditingController sifrecontroller2 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState>? formKey = GlobalKey<FormState>();



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
          onTap: () {
            Route route = MaterialPageRoute(builder: (context){return
              const LoginScreen();});
            Navigator.push(context, route);
          },
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
          TextFormField(
            controller: mailcontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'E-posta alanı boş bırakılamaz!';
              }
              return null;
            },
            decoration:InputDecoration(
              hintText: "E-posta adresinizi giriniz",

            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: sifrecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Şifre alanı boş bırakılamaz!';
              }
              return null;
            },
            decoration:InputDecoration(
              hintText: "Şifrenizi giriniz",

            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: sifrecontroller2,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Şifre alanı boş bırakılamaz!';
              }
              return null;
            },
            decoration:InputDecoration(
              hintText: "Şifrenizi tekrar giriniz",

            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterScreen2(
                          p_mail: mailcontroller.text,
                          p_sifre: sifrecontroller2.text,
                        )
                    ));
              };
            },
            innerText: "İlerle",
            fitWidth: true,
          ),
          const SizedBox(height: 16),
          bottomTextSection,
        ],
      ),
    );

    var formSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      height: (size.height / 5)*2,
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


