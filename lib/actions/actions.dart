import 'package:hellodoc/config/api.dart';
import 'package:hellodoc/helpers/auth_backend.dart';
import 'package:hellodoc/models/entities/anabilimdali.dart';
import 'package:hellodoc/models/entities/doktor.dart';
import 'package:hellodoc/models/entities/uzmanlik.dart';
import 'package:hellodoc/models/relationals/mesaj.dart';
import 'package:hellodoc/socket/connection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Mesaj>> fetchMessages({dNo, hNo, gorusme = false}) async {
  bool isDNOTyped = dNo != null;
  bool isHNOTyped = hNo != null;
  bool isAnyFilter = isDNOTyped || isHNOTyped;

  String url = "$API_BASE/mesajlar${gorusme ? "/gorusme" : ""}";
  if (isAnyFilter) url += "?";
  if (isDNOTyped && isHNOTyped) {
    url += "dNo=$dNo&hNo=$hNo";
  } else if (isDNOTyped) {
    url += "dNo=$dNo";
  } else if (isHNOTyped) {
    url += "hNo=$hNo";
  }

  http.Response response = await http.get(
    Uri.parse(url),
    headers: {
      ...authBackend,
    },
  );

  if (response.statusCode == 200 || response.statusCode == 304) {
    var body = jsonDecode(response.body)["data"];

    List<Mesaj> mesajlar = [];

    body.forEach((data) {
      mesajlar.add(Mesaj.fromJson(data));
    });

    return mesajlar;
  } else {
    throw Exception("Fetching failed!");
  }
}

Future sendMessage({
  required icerik,
  resim,
  dosya,
  required gonderen,
  required dNo,
  required dUzNo,
  required hNo,
}) async {
  String url = "$API_BASE/mesajlar/gonder";

  http.Response response = await http.post(
    Uri.parse(url),
    headers: {
      ...authBackend,
      "Content-Type": "application/json",
    },
    body: jsonEncode(<String, dynamic>{
      "icerik": icerik,
      "resim": resim,
      "dosya": dosya,
      "gonderen": gonderen,
      "dNo": dNo,
      "dUzNo": dUzNo,
      "hNo": hNo,
    }),
  );

  if (response.statusCode == 200 || response.statusCode == 304) {
    var body = jsonDecode(response.body);

    return body;
  } else {
    throw Exception("Fetching failed!");
  }
}

Future<List<AnaBilimDali>> fetchAnaBilimDallari() async {
  String url = "$API_BASE/anabilimdallari";

  http.Response response = await http.get(
    Uri.parse(url),
    headers: {
      ...authBackend,
    },
  );

  if (response.statusCode == 200 || response.statusCode == 304) {
    var body = jsonDecode(response.body)["data"];

    List<AnaBilimDali> anabilimdallari = [];

    body.forEach((data) {
      anabilimdallari.add(AnaBilimDali.fromJson(data));
    });

    return anabilimdallari;
  } else {
    throw Exception("Fetching failed!");
  }
}

Future<List<Uzmanlik>> fetchUzmanliklar() async {
  String url = "$API_BASE/uzmanliklar";

  http.Response response = await http.get(
    Uri.parse(url),
    headers: {
      ...authBackend,
    },
  );

  if (response.statusCode == 200 || response.statusCode == 304) {
    var body = jsonDecode(response.body)["data"];

    List<Uzmanlik> uzmanliklar = [];

    body.forEach((data) {
      uzmanliklar.add(Uzmanlik.fromJson(data));
    });

    return uzmanliklar;
  } else {
    throw Exception("Fetching failed!");
  }
}

Future<List<Doktor>> fetchDoktorlar({abdNo, uzNo}) async {
  Map typedChecks = {
    "abdNo": {
      "kosul": abdNo != null,
      "veri": abdNo,
    },
    "uzNo": {
      "kosul": uzNo != null,
      "veri": uzNo,
    },
  };

  int filteredCount = typedChecks.values.where((v) => v["kosul"] == true).length;
  print("filteredCount: $filteredCount");

  String url = "$API_BASE/doktorlar";
  if (filteredCount > 0) url += "?";

  List query = [];

  typedChecks.forEach((key, value) {
    if (value["kosul"]) {
      String degisken = key;
      String veri = value["veri"].toString();
      query.add("$degisken=$veri");
    }
  });

  url += query.join('&');

  print(url);

  http.Response response = await http.get(
    Uri.parse(url),
    headers: {
      ...authBackend,
    },
  );

  if (response.statusCode == 200 || response.statusCode == 304) {
    var body = jsonDecode(response.body)["data"];

    List<Doktor> doktorlar = [];

    body.forEach((data) {
      doktorlar.add(Doktor.fromJson(data));
    });

    return doktorlar;
  } else {
    throw Exception("Fetching failed!");
  }
}
