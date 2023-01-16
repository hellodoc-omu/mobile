import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/screens/dr_register_screen.dart';
import 'package:hellodoc/screens/register_screen.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/textbox.dart';
import 'package:hellodoc/screens/hasta.dart';




class RegisterScreen2 extends StatefulWidget {
  String p_mail, p_sifre;
  RegisterScreen2({required this.p_mail, required this.p_sifre});


  @override
  State<RegisterScreen2> createState() => _RegisterScreen2();
}

class _RegisterScreen2 extends State<RegisterScreen2> {
  TextEditingController isimcontroller = TextEditingController();
  TextEditingController soyadcontroller = TextEditingController();
  TextEditingController resimcontroller = TextEditingController();

  var hasta = User(-1, "", "", "", "", true, true, "");


  int deger = 0;

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
            onTap: () {
              if (formKey2!.currentState!.validate()) {
                formKey2!.currentState!.save();
                print(hasta.toJson());
               /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterScreen2(
                          p_mail: mailcontroller.text,
                          p_sifre: sifrecontroller2.text,
                        )
                    ));*/
              };
            },
            innerText: "Hasta Olarak İlerle",
            fitWidth: true,
          ),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {
              if (formKey!.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DrRegisterScreen(
                          p_isim: isimcontroller.text,
                          p_soyad: soyadcontroller.text,
                          pp_mail: widget.p_mail,
                          pp_sifre: widget.p_sifre,
                        )
                    ));
              };
            },
            innerText: "Doktor Olarak İlerle",
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
            SizedBox(height: 50),
            TextFormField(
              controller: isimcontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'İsim alanı boş bırakılamaz!';
                }
                return null;
              },
              onSaved: (value) {
                hasta.ad = value.toString();
                hasta.email = widget.p_mail ;
                hasta.sifre = widget.p_sifre;
              },
              decoration:InputDecoration(
                hintText: "İsminizi giriniz",

              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: soyadcontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Soyad alanı boş bırakılamaz!';
                }
                return null;
              },
              onSaved: (value) {
                hasta.soyad = value.toString();
              },
              decoration:InputDecoration(
                hintText: "Soyadınızı giriniz",

              ),
            ),
          ],

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          Route route = MaterialPageRoute(builder: (context){return
                            RegisterScreen();});
                          Navigator.push(context, route);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30.0,
                        ),)
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



