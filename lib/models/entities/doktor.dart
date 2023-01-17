class Doktor {
  final int dNo;
  final String kIsim;
  final String kSoyIsim;
  final String? kAvatar;
  final String kMail;
  final String kSifre;
  final String kCinsiyet;
  final int kOnline;
  final String kuIsim;
  final String fIsim;
  final String abdIsim;
  final List uzmanliklar;

  const Doktor({
    required this.dNo,
    required this.kIsim,
    required this.kSoyIsim,
    required this.kMail,
    required this.kSifre,
    required this.kCinsiyet,
    required this.kOnline,
    required this.kuIsim,
    required this.fIsim,
    required this.abdIsim,
    required this.uzmanliklar,
    this.kAvatar,
  });

  factory Doktor.blank() {
    return const Doktor(
      dNo: -1,
      kIsim: "",
      kSoyIsim: "",
      kMail: "",
      kSifre: "",
      kCinsiyet: "",
      kOnline: 0,
      kuIsim: "",
      fIsim: "",
      abdIsim: "",
      uzmanliklar: [],
    );
  }

  factory Doktor.fromJson(Map<String, dynamic> json) {
    return Doktor(
      dNo: json["dNo"],
      kIsim: json["kIsim"],
      kSoyIsim: json["kSoyIsim"],
      kMail: json["kMail"],
      kSifre: json["kSifre"],
      kCinsiyet: json["kCinsiyet"],
      kOnline: json["kOnline"],
      kuIsim: json["kuIsim"],
      fIsim: json["fIsim"],
      abdIsim: json["abdIsim"],
      uzmanliklar: json["uzmanliklar"],
    );
  }

  dynamic getValue(String key) {
    switch (key) {
      case "dNo":
        return dNo;
      case "kIsim":
        return kIsim;
      case "kSoyIsim":
        return kSoyIsim;
      default:
    }
  }
}
