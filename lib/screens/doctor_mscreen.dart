import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/grid_button.dart';
import 'package:hellodoc/widgets/user_avatar.dart';

class DoctorMainScreen extends StatefulWidget {
  const DoctorMainScreen({super.key});

  @override
  State<DoctorMainScreen> createState() => _DoctorMainScreen();
}

class _DoctorMainScreen extends State<DoctorMainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var docName = const Text(
      "Yunus Emre Türk",
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );

    var docMail = Text(
      "yunus.emre.turk@bil.omu.edu.tr",
      style: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontSize: 14,
      ),
    );

    var doctorInfoSection = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const UserAvatar(),
        docName,
        docMail,
      ],
    );

    var gbList = [
      GridButton(
        onTap: () => null,
        color: colors["dreProfile"],
        icon: Icons.account_box,
        title: "Profilim",
      ),
      GridButton(
        onTap: () => null,
        color: colors["dreMessages"],
        icon: Icons.message,
        title: "Mesajlarım",
      ),
      GridButton(
        onTap: () => null,
        color: colors["dreNotifications"],
        icon: Icons.notifications,
        title: "Bildirimlerim",
      ),
      GridButton(
        onTap: () => null,
        color: colors["dreSettings"],
        icon: Icons.settings,
        title: "Ayarlarım",
      ),
      GridButton(
        onTap: () => null,
        color: colors["dreHelp"],
        icon: Icons.help_center,
        title: "Yardım",
      ),
      GridButton(
        onTap: () => null,
        color: colors["dreExit"],
        icon: Icons.logout,
        title: "Çıkış",
      ),
    ];

    var buttonsGrid = GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: gbList,
    );

    return Scaffold(
      backgroundColor: colors["primary"],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * 0.275,
            child: doctorInfoSection,
          ),
          SizedBox(height: size.height * 0.725, child: buttonsGrid),
        ],
      ),
    );
  }
}
