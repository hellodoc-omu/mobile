import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/textbox.dart';



class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2({super.key});

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2();
}

class _RegisterScreen2 extends State<RegisterScreen2> {
  final nameController = TextEditingController();

  GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  GlobalKey<FormState>? formKey2 = GlobalKey<FormState>();

  late String valueChoose;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    var buttons = Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
            onTap: () {},
            innerText: "Kayıt Ol",
            fitWidth: true,
          ),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {},
            innerText: "İlerle",
            fitWidth: true,
          ),
        ],
      ),
    );

    var middle = Form(
      key: formKey2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage("https://picsum.photos/seed/picsum/300/300"),
                    ),
                ),
                SizedBox(width: 25),
                CustomButton(
                  onTap: () {},
                  innerText: "Yükle",
                  innerTextSize: 15,
                ),
              ],
            ),
            const SizedBox(height: 100),
            Textbox(
              hintText: "Boş",
              obscureText: true,
              controller: nameController,
              validator: (v) => null,
            ),
            const SizedBox(height: 16),
            Textbox(
              hintText: "Boş",
              obscureText: true,
              controller: nameController,
              validator: (v) => null,
            ),
          ],

          ),
          Row(

          )
        ],
      ),
    );


    return Scaffold(
      backgroundColor: colors["secondary"],
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ],
                ),
                SizedBox(height: size.height/20),
                Text(
                  'Profil Resmim',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: (size.height / 2),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: middle,
                    ),
                  ),
                ),
                SizedBox(
                  height: (size.height / 4),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: buttons,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}



