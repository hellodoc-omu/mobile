class Uzmanlik {
  final int uzNo;
  final String uzIsim;

  const Uzmanlik({
    required this.uzNo,
    required this.uzIsim,
  });

  factory Uzmanlik.blank() {
    return const Uzmanlik(uzNo: -1, uzIsim: "");
  }

  factory Uzmanlik.fromJson(Map<String, dynamic> json) {
    return Uzmanlik(
      uzNo: json["uzNo"],
      uzIsim: json["uzIsim"],
    );
  }

  dynamic getValue(String key) {
    if (key == "uzNo") {
      return uzNo;
    } else if (key == "uzIsim") {
      return uzIsim;
    }
  }
}
