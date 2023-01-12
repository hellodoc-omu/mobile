import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/textbox.dart';



class DrRegisterScreen extends StatefulWidget {
  const DrRegisterScreen({super.key});

  @override
  State<DrRegisterScreen> createState() => _DrRegisterScreen();
}

class _DrRegisterScreen extends State<DrRegisterScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  late String valueChoose;

  bool? check1 = false;
  bool? check2 = false;
  bool? check3 = false;





  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    var form = Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Textbox(
            hintText: "Boş",
            obscureText: true,
            controller: nameController,
            validator: (v) => null,
          ),const SizedBox(height: 16),
          Textbox(
            hintText: "Boş",
            obscureText: true,
            controller: nameController,
            validator: (v) => null,
          ),
          const SizedBox(height: 16),
          Textbox(
            hintText: "Bulunduğunuz Hastahene veya Klinik",
            obscureText: true,
            controller: nameController,
            validator: (v) => null,
          ),
          const SizedBox(height: 16),
          Container(
            height: 300,
            width: 300,
            color: Colors.grey[100],
            child: Column(
              children: [
                SizedBox(height: 1),
                Text("Uzmanlıklarınız"),
                Container(
                  width: 270,
                  height: 270,
                  color: Colors.white60,
                  child: Column(
                    children: [
                      CheckboxListTile( //checkbox positioned at right
                        value: check1,
                        onChanged: (bool? value) {
                          setState(() {
                            check1 = value;
                          });
                        },
                        title: Text("Kardiyoloji"),
                      ),
                      CheckboxListTile( //checkbox positioned at right
                        value: check2,
                        onChanged: (bool? value) {
                          setState(() {
                            check2 = value;
                          });
                        },
                        title: Text("Dermatoloji"),
                      ),
                      CheckboxListTile( //checkbox positioned at right
                        value: check3,
                        onChanged: (bool? value) {
                          setState(() {
                            check3 = value;
                          });
                        },
                        title: Text("Kadın doğum"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {},
            innerText: "Bitir",
            fitWidth: true,
          ),
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
                SizedBox(height: 50),
                Text(
                  'Doktor Bilgileri',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: (size.height / 4)*3,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: form,
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





