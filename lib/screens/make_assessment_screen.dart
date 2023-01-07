import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/textbox.dart';



class MakeAssessmentScreen extends StatefulWidget {
  const MakeAssessmentScreen({super.key});

  @override
  State<MakeAssessmentScreen> createState() => _MakeAssessmentScreen();
}

class _MakeAssessmentScreen extends State<MakeAssessmentScreen> {

  GlobalKey<FormState>? formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    var form = Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
                "Doktor",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            ),
            SizedBox(height: 25),
            Text(
                "Berkay Gebeş",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
            SizedBox(height: 25),
            Text(
                "Değerlendirmem",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(width: 30),
                Text(
                    "Puan",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                SizedBox(width: 50,),
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
            SizedBox(height: 30,),
            Container(
              child: Text(
                "Değerlendirmenizi Yazınız ...",
              ),
              width: 375,
              height: 350,
              color: Colors.grey[100],
            ),
            SizedBox(height: 30),
            CustomButton(
              onTap: () {},
              innerText: "İlerle",
              fitWidth: true,
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
                    "Cilt Hastalıkları",
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
                form

              ],
            ),
          ],
        ),
      ),
    );
  }
}





