import 'package:flutter/material.dart';
import 'package:hellodoc/utilities/utilities.dart';
import 'package:hellodoc/widgets/doctor_knowledge.dart';
import 'package:hellodoc/widgets/previous_meetings.dart';
import 'package:hellodoc/widgets/star_rating.dart';
import '../helpers/variable_breakpoints.dart';
import '../widgets/custom_button.dart';
import '../widgets/profile.dart';

class DoctorProfileSeenByPatient extends StatefulWidget {
  const DoctorProfileSeenByPatient({super.key});

  @override
  State<DoctorProfileSeenByPatient> createState() =>
      _DoctorProfileSeenByPatient();
}

class _DoctorProfileSeenByPatient extends State<DoctorProfileSeenByPatient> {
  @override
  Widget build(BuildContext context) {
    //profil widget contains a doctor's profile photo,name surname and email

    var topBar = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Expanded(
              child: Text(
                'Profilim',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            SizedBox(
              child: CustomButton(
                onTap: () {},
                innerText: "Mesaj Gönder",
                bgColor: Colors.white,
                innerTextColor: Colors.black45,
                innerTextSize: 12,
                innerTextPaddingV: 8,
              ),
            ),
          ],
        ),
      ],
    );

    Widget doctorKnowledge = ConstrainedBox(
      constraints: const BoxConstraints.expand(height: 250, width: 300),
      child: doctorCard(
          'Ondokuz Mayıs Üniversitesi Hastanesi',
          'Cerrahpaşa Tıp Fakültesi',
          'Dermotoloji',
          'Cilt Hastalıkları,Göz Hastalıkları'),
    );

    Widget previousmeets = ConstrainedBox(
      constraints: const BoxConstraints.expand(height: 200, width: 150),
      child: meetingCard(),
    );

    var shadowedCoctorCard = applyShadowToWidget(w: doctorKnowledge);
    var shadowedMeetsCard = applyShadowToWidget(w: previousmeets);

    return Scaffold(
      backgroundColor: colors["primary"],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          topBar,
          profil('Berkay Gebeş', 'berkay.gebes@bil.omu.edu.tr'),
          stars(30, true),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Önceki Görüşmeler',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 10),
            child: shadowedMeetsCard,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
            child: shadowedCoctorCard,
          ),
        ],
      ),
    );
  }
}
