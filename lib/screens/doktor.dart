
class User2{
  int userNo;
  String email;
  String sifre;
  String ad;
  String soyad;
  String mezun;
  String anabilim;
  String bulunduguH;
  bool cinsiyet;
  bool aktifDurum;
  String? resimYolu;

  User2(this.userNo, this.email, this.sifre, this.ad, this.soyad, this.mezun,
      this.anabilim, this.bulunduguH, this.cinsiyet, this.aktifDurum, this.resimYolu);
// düzenlemeyi unutma
  User2.fromJson(Map json)
      : userNo = int.tryParse(json["hasta_no"].toString())!,
        email = json["email"],
        sifre = json["sifre"],
        ad = json["ad"],
        soyad = json["soyad"],
        mezun = json["mezun"],
        anabilim = json["anabilim"],
        bulunduguH = json["bulunduguH"],
        cinsiyet = json["cinsiyet"] == 0 ? false : true,
        aktifDurum = json["aktif_durum"] == 0 ? false : true,
        resimYolu = json["resim_yolu"] == "null" ? null : json["resim_yolu"];
// düzenlemeyi unutma
  Map toJson() {
    return {
      // database isimlerrini güncelle
      "hasta_no": userNo,
      "email": email,
      "sifre": sifre,
      "ad": ad,
      "soyad": soyad,
      "mezun": mezun,
      "anabilim": anabilim,
      "bulunduguH": bulunduguH,
      "cinsiyet": cinsiyet ? 1 : 0,
      "aktif_durum": aktifDurum ? 1 : 0,
      "resim_yolu": resimYolu ?? "",
    };
  }
}
