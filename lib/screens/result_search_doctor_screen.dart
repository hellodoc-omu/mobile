import 'package:flutter/material.dart';
import 'package:hellodoc/models/entities/doktor.dart';
import 'package:hellodoc/screens/chat_screen.dart';
import 'package:hellodoc/screens/doctors_profile_seen_bypatient.dart';
import 'package:hellodoc/screens/messages_screen.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/dListTile.dart';
import 'package:hellodoc/widgets/star_rating.dart';
import '../widgets/drawer/custom_drawer.dart';
import '../helpers/variable_breakpoints.dart';

class ResultSearchDoctorScreen extends StatefulWidget {
  const ResultSearchDoctorScreen({
    super.key,
    this.hNo = 2,
    required this.result,
    this.istenilenUzmanlik,
  });

  final int hNo;

  final List<Doktor> result;
  final String? istenilenUzmanlik;

  @override
  State<ResultSearchDoctorScreen> createState() => _ResultSearchDoctorScreen();
}

class _ResultSearchDoctorScreen extends State<ResultSearchDoctorScreen> {
  var array = [
    DoctorListTile(
      onTap: () {},
      titleText: 'Berkay Gebeş',
      subTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Dermotoloji'),
          stars(10, true),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.send,
          color: colors["primary"],
        ),
        onPressed: () {},
      ),
    ),
    DoctorListTile(
      onTap: () {},
      titleText: 'Esra Türk',
      subTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Kardiyoloji'),
          stars(10, true),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.send,
          color: colors["primary"],
        ),
        onPressed: () {},
      ),
    ),
    DoctorListTile(
      onTap: () {},
      titleText: 'Yunus Emre Türk',
      subTitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Dermotoloji'),
          stars(10, true),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.send,
          color: colors["primary"],
        ),
        onPressed: () {},
      ),
      isOnline: true,
    ),
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Center(
        child: CustomButton(
          onTap: () {},
          innerText: 'Geri dön',
          innerTextSize: 14,
          innerTextPaddingV: 12,
          innerTextPaddingH: 17,
        ),
      ),
    )
  ];

  doktoruGoruntule(Doktor d) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => DoctorProfileSeenByPatient(doktor: d)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors["primary"],
        title: const Text(
          'Aradığınız Doktorlar',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.black.withOpacity(0.1), thickness: 1);
        },
        itemBuilder: ((context, index) {
          Doktor doktor = widget.result[index];

          return DoctorListTile(
            onTap: () {},
            titleText: "${doktor.kIsim} ${doktor.kSoyIsim}",
            subTitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.istenilenUzmanlik == null
                    ? Row(
                        children:
                            doktor.uzmanliklar.map((e) => Text(e)).toList(),
                      )
                    : Text(widget.istenilenUzmanlik!),
                stars(10, true),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.send,
                color: colors["primary"],
              ),
              onPressed: () {
                dynamic opposite = {
                  "isimSoyisim": "${doktor.kIsim} ${doktor.kSoyIsim}",
                  "online": doktor.kOnline,
                  "avatar": doktor.kAvatar,
                };

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatScreen(
                    amIDoctor: false,
                    opposite: opposite,
                    dNo: doktor.dNo,
                    hNo: widget.hNo,
                  );
                }));
              },
            ),
          );
        }),
        itemCount: widget.result.length,
      ),
    );
  }
}
