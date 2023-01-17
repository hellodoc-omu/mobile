class AnaBilimDali {
  final int abdNo;
  final String abdIsim;

  const AnaBilimDali({
    required this.abdNo,
    required this.abdIsim,
  });

  factory AnaBilimDali.blank() {
    return const AnaBilimDali(abdNo: -1, abdIsim: "");
  }

  factory AnaBilimDali.fromJson(Map<String, dynamic> json) {
    return AnaBilimDali(
      abdNo: json["abdNo"],
      abdIsim: json["abdIsim"],
    );
  }

  dynamic getValue(String key) {
    if (key == "abdNo") {
      return abdNo;
    } else if (key == "abdIsim") {
      return abdIsim;
    }
  }
}
