import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/textbox.dart';



class AllMeetingsScreen extends StatefulWidget {
  const AllMeetingsScreen({super.key});

  @override
  State<AllMeetingsScreen> createState() => _AllMeetingsScreen();
}

class _AllMeetingsScreen extends State<AllMeetingsScreen> {
  final nameController = TextEditingController();

  GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  GlobalKey<FormState>? formKey2 = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var form = Form(
      key: formKey,
      child: SizedBox(
        height: 75,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 20,),
                Column(
                  children: [
                    Text(
                      "Cilt Hastalıkları",
                      style: TextStyle(
                        height: 2,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "27/12/2022",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 50),
                SizedBox(
                  width: 150,
                  height: 50,
                  child:
                  CustomButton(
                    innerTextWeight: FontWeight.w200,
                    innerTextSize: 15,
                    onTap: () {},
                    innerText: "Değerlendir",
                    fitWidth: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );


    var form2 = Form(
      key: formKey2,
      child: SizedBox(
        height: 75,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 20,),
                Column(
                  children: [
                    Text(
                      "Cilt Hastalıkları",
                      style: TextStyle(
                        height: 2,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "26/12/2022",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 60),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_outline,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_outline,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );



    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 75,
              color: colors["primary"],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 25),
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Görüşmelerim",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                form,
                form2,
              ],
            ),
          ],
        ),
      ),
    );
  }
}





