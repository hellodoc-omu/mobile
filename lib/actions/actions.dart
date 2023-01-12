import 'package:hellodoc/config/api.dart';
import 'package:hellodoc/helpers/auth_backend.dart';
import 'package:hellodoc/models/relationals/mesaj.dart';
import 'package:hellodoc/widgets/drawer/drawer_header.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Mesaj>> fetchMessages({dNo, hNo}) async {
  bool isDNOTyped = dNo != null;
  bool isHNOTyped = hNo != null;
  bool isAnyFilter = isDNOTyped || isHNOTyped;

  String url = "$API_BASE/mesajlar";
  if (isAnyFilter) url += "?";
  if (isDNOTyped) url += "dNo=$dNo";
  if (isHNOTyped) url += "hNo=$hNo";

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
