import 'package:hellodoc/utilities/utilities.dart';

class Mesaj {
  final int no;
  final String icerik;
  final dynamic resim;
  final dynamic dosya;
  final String tarih;
  final dynamic doktor;
  final dynamic hasta;

  const Mesaj({
    required this.no,
    required this.icerik,
    required this.resim,
    required this.dosya,
    required this.tarih,
    required this.doktor,
    required this.hasta,
  });

  factory Mesaj.fromJson(Map<String, dynamic> json) {
    return Mesaj(
      no: json["mNo"],
      icerik: json["mIcerik"],
      resim: json["mResim"],
      dosya: json["mDosya"],
      tarih: json["mTarih"],
      doktor: {
        "no": json["doktor"]["dNo"],
        "avatar": json["doktor"]["avatar"],
        "isimSoyisim": json["doktor"]["isimSoyisim"],
        "ilgiliUzmanlik": json["doktor"]["ilgiliUzmanlik"],
        "online": json["doktor"]["online"],
      },
      hasta: {
        "no": json["hasta"]["hNo"],
        "avatar": json["hasta"]["avatar"],
        "isimSoyisim": json["hasta"]["isimSoyisim"],
        "online": json["doktor"]["online"],
      },
    );
  }
}
