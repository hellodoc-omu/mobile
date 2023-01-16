import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/screens/register_screen.dart';
import 'package:hellodoc/screens/register_screen2.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/textbox.dart';
import 'package:hellodoc/screens/doktor.dart';
import 'package:hellodoc/screens/hasta.dart';




class DrRegisterScreen extends StatefulWidget {
  String p_isim, p_soyad, pp_mail, pp_sifre;
  DrRegisterScreen({required this.p_isim, required this.p_soyad,required this.pp_mail,required this.pp_sifre });

  @override
  State<DrRegisterScreen> createState() => _DrRegisterScreen();
}

class _DrRegisterScreen extends State<DrRegisterScreen> {
  TextEditingController mezunolunanfakultecontroller = TextEditingController();
  TextEditingController anabilimdalicontroller = TextEditingController();
  TextEditingController bulunduguhastanecontroller = TextEditingController();

  var doktor = User2(-1, "", "", "", "", "", "", "", true, true, "");
  var hasta = User(-1, "", "", "", "", true, true, "");

  GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  late String valueChoose;

  bool? check1 = false;
  bool? check2 = false;
  bool? check3 = false;
  bool? check4 = false;





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
        TextFormField(
          controller: mezunolunanfakultecontroller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Bu alan boş bırakılamaz!';
            }
            return null;
          },
          onSaved: (value) {
            doktor.mezun = value.toString();
          },
          decoration:InputDecoration(
            hintText: "Mezun Olduğunuz Fakülte",

          ),
        ),
          const SizedBox(height: 16),
          TextFormField(
            controller: anabilimdalicontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Bu alan boş bırakılamaz!';
              }
              return null;
            },
            onSaved: (value) {
              doktor.anabilim = value.toString();
              doktor.email = widget.pp_mail;
              doktor.sifre = widget.pp_sifre;
              doktor.ad = widget.p_isim;
              doktor.soyad = widget.p_soyad;
            },
            decoration:InputDecoration(
              hintText: "Ana Bilim Dalınız",

            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: bulunduguhastanecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Bu alan boş bırakılamaz!';
              }
              return null;
            },
            onSaved: (value) {
              doktor.bulunduguH = value.toString();
            },
            decoration:InputDecoration(
              hintText: "Bulunduğunuz Hastane /Klinik",

            ),
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
                      CheckboxListTile( //checkbox positioned at right
                        value: check4,
                        onChanged: (bool? value) {
                          setState(() {
                            check4 = value;
                          });
                        },
                        title: Text("Cildiye"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            onTap: () {
              if (formKey!.currentState!.validate()) {
                formKey!.currentState!.save();
                print(doktor.toJson());
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        Route route = MaterialPageRoute(builder: (context){return
                          RegisterScreen2(p_mail: "", p_sifre: "");});
                        Navigator.push(context, route);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),)
                  ],
                ),
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





