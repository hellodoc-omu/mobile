import 'package:flutter/material.dart';
import 'package:hellodoc/actions/actions.dart';
import 'package:hellodoc/models/entities/anabilimdali.dart';
import 'package:hellodoc/models/entities/doktor.dart';
import 'package:hellodoc/models/entities/uzmanlik.dart';
import 'package:hellodoc/screens/doctors_profile_seen_bypatient.dart';
import 'package:hellodoc/screens/result_search_doctor_screen.dart';
import 'package:hellodoc/utilities/utilities.dart';
import 'package:hellodoc/widgets/ac_textbox.dart';
import 'package:hellodoc/widgets/custom_button.dart';
import 'package:hellodoc/widgets/drawer/custom_drawer.dart';
import '../helpers/variable_breakpoints.dart';
import '../widgets/logo.dart';

class SearchDoctorScreen extends StatefulWidget {
  const SearchDoctorScreen({super.key});

  @override
  State<SearchDoctorScreen> createState() => _SearchDoctorScreen();
}

class _SearchDoctorScreen extends State<SearchDoctorScreen> {
  Future<List<AnaBilimDali>> anabilimdallari = fetchAnaBilimDallari();
  Future<List<Uzmanlik>> uzmanliklar = fetchUzmanliklar();
  Future<List<Doktor>> doktorlar = fetchDoktorlar();

  AnaBilimDali? abd;
  Uzmanlik? uz;
  Doktor? d;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    verileriYenile({abdNo, uzNo}) {
      setState(() {
        if (abdNo == null) anabilimdallari = fetchAnaBilimDallari();
        if (uzNo == null) uzmanliklar = fetchUzmanliklar();
        doktorlar = fetchDoktorlar(
          abdNo: abdNo,
          uzNo: uzNo,
        );
      });
    }

    doktorlariGoruntule(List<Doktor> doktorlar) {
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return ResultSearchDoctorScreen(result: doktorlar);
      })));
    }

    Widget anaBilimDaliBox(List<AnaBilimDali> abd) {
      if (abd.isEmpty) return const SizedBox.shrink();

      return AutoCompleteTextbox(
        options: abd.map((a) => a.abdIsim).toList(),
        onSelected: (String value) {
          this.abd = getObjectFromKeyValue(
            list: abd,
            key: "abdIsim",
            value: value,
          );

          if (uz != null) {
            verileriYenile(
              abdNo: this.abd!.abdNo,
              uzNo: uz!.uzNo,
            );
          } else {
            verileriYenile(
              abdNo: this.abd!.abdNo,
            );
          }
        },
        hintText: "Ana bilim dalı seçiniz",
      );
    }

    Widget uzmanlikBox(List<Uzmanlik> uz) {
      if (uz.isEmpty) return const SizedBox.shrink();

      return AutoCompleteTextbox(
        options: uz.map((u) => u.uzIsim).toList(),
        onSelected: (String value) {
          this.uz = getObjectFromKeyValue(
            list: uz,
            key: "uzIsim",
            value: value,
          );

          if (abd != null) {
            verileriYenile(
              uzNo: this.uz!.uzNo,
              abdNo: abd!.abdNo,
            );
          } else {
            verileriYenile(
              uzNo: this.uz!.uzNo,
            );
          }
        },
        hintText: "Uzmanlık alanı seçiniz",
      );
    }

    doktoruGoruntule(Doktor d) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => DoctorProfileSeenByPatient(doktor: d)),
        ),
      );
    }

    Widget doktorBox(List<Doktor> doktor) {
      if (doktor.isEmpty) return const SizedBox.shrink();

      return AutoCompleteTextbox(
        options: doktor.map((d) => "${d.kIsim} ${d.kSoyIsim}").toList(),
        onSelected: (String value) {
          List<String> parcalar = value.split(' ');
          String isim = parcalar.getRange(0, parcalar.length - 1).join(' ');
          print(isim);
          String soyisim = parcalar.last;
          print(soyisim);

          d = getObjectFromKeyValue(
            list: doktor,
            key: "kIsim",
            value: isim,
            secondKey: "kSoyIsim",
            secondValue: soyisim,
          );

          doktoruGoruntule(d!);
        },
        hintText: "Doktor ismi ile ara...",
      );
    }

    return Scaffold(
      backgroundColor: colors["primary"],
      appBar: AppBar(
        backgroundColor: colors["primary"],
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: size.height / 2,
              child: Center(child: Logo.square(width: 230)),
            ),
            SizedBox(
              height: size.height / 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: ListView(
                    children: [
                      futureBridge(
                          child: anaBilimDaliBox, future: anabilimdallari),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: futureBridge(
                            child: uzmanlikBox, future: uzmanliklar),
                      ),
                      futureBridge(child: doktorBox, future: doktorlar),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: CustomButton(
                          onTap: () async {
                            doktorlariGoruntule(await doktorlar);
                          },
                          innerText: "Doktor Ara",
                          fitWidth: true, 
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
