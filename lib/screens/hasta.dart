class User{
  int userNo;
  String email;
  String sifre;
  String ad;
  String soyad;
  bool cinsiyet;
  bool aktifDurum;
  String? resimYolu;

  User(this.userNo, this.email, this.sifre, this.ad, this.soyad,
      this.cinsiyet, this.aktifDurum, this.resimYolu);

  User.fromJson(Map json)
      : userNo = int.tryParse(json["hasta_no"].toString())!,
        email = json["email"],
        sifre = json["sifre"],
        ad = json["ad"],
        soyad = json["soyad"],
        cinsiyet = json["cinsiyet"] == 0 ? false : true,
        aktifDurum = json["aktif_durum"] == 0 ? false : true,
        resimYolu = json["resim_yolu"] == "null" ? null : json["resim_yolu"];

  Map toJson() {
    return {
      // database isimlerrini güncelle
      "hasta_no": userNo,
      "email": email,
      "sifre": sifre,
      "ad": ad,
      "soyad": soyad,
      "cinsiyet": cinsiyet ? 1 : 0,
      "aktif_durum": aktifDurum ? 1 : 0,
      "resim_yolu": resimYolu ?? "",
    };
  }
}

