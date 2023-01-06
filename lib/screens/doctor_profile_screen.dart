import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/utilities/utilities.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/star_rating.dart';
import '../widgets/doctor_knowledge.dart';
import '../widgets/profile.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreen();
}

class _DoctorProfileScreen extends State<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var shadowedDoctorCard = applyShadowToWidget(
        w: doctorCard(
            'Ondokuz Mayıs Üniversitesi Hastanesi',
            'Cerrahpaşa Tıp Fakültesi',
            'Dermotoloji',
            'Cilt Hastalıkları,Göz Hastalıkları'));

    var button = Expanded(
      child: CustomButton(
        onTap: () {},
        innerText: 'Profilimi Güncelle',
        bgColor: Colors.white,
        innerTextColor: Colors.black26,
        innerTextPaddingH: 12,
        innerTextPaddingV: 14,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(7),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: colors["primary"],
        title: const Text(
          'Profilim',
        ),
      ),
      backgroundColor: colors["primary"],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          profil('Berkay Gebeş', 'berkay.gebes@bil.omu.edu.tr'),
          stars(30, true),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
            child: shadowedDoctorCard,
          ),
        ],
      ),
    );
  }
}
