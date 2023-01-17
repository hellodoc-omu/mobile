import 'package:flutter/material.dart';
import 'package:hellodoc/models/entities/doktor.dart';
import 'package:hellodoc/utilities/utilities.dart';
import 'package:hellodoc/widgets/doctor_knowledge.dart';
import 'package:hellodoc/widgets/previous_meetings.dart';
import 'package:hellodoc/widgets/star_rating.dart';
import '../helpers/variable_breakpoints.dart';
import '../widgets/custom_button.dart';
import '../widgets/profile.dart';

class DoctorProfileSeenByPatient extends StatefulWidget {
  const DoctorProfileSeenByPatient({super.key, required this.doktor});

  final Doktor doktor;

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
                'Doktor Profili',
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

    var shadowedDoctorCard = applyShadowToWidget(
      w: doctorCard(
        widget.doktor.kuIsim,
        widget.doktor.fIsim,
        widget.doktor.abdIsim,
        widget.doktor.uzmanliklar.join(', '),
      ),
    );
    var shadowedMeetsCard = applyShadowToWidget(w: meetingCard());

    String isimSoyisim = "${widget.doktor.kIsim} ${widget.doktor.kSoyIsim}";

    return Scaffold(
      backgroundColor: colors["primary"],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          topBar,
          profil(isimSoyisim, widget.doktor.kMail),
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
            child: shadowedDoctorCard,
          ),
        ],
      ),
    );
  }
}
