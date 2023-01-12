import 'package:flutter/material.dart';
import 'package:hellodoc/actions/actions.dart';
import 'package:hellodoc/models/relationals/mesaj.dart';
import 'package:hellodoc/utilities/utilities.dart';
import 'package:hellodoc/widgets/mListTile.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  final bool isDoktor = true;

  @override
  State<MessagesScreen> createState() => _MessagesScreen();
}

class _MessagesScreen extends State<MessagesScreen> {
  Future<List<Mesaj>> msj = fetchMessages();

  @override
  Widget build(BuildContext context) {
    Widget messageList(List<Mesaj> msjList) {
      return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.black.withOpacity(0.1), thickness: 1);
        },
        itemCount: msjList.length,
        itemBuilder: ((context, index) {
          Mesaj m = msjList[index];
          dynamic opposite = widget.isDoktor ? m.doktor : m.hasta;

          return MessageListTile(
            avatar: opposite["avatar"],
            titleText: opposite["isimSoyisim"],
            subTitleText: m.icerik,
            onTap: () {},
          );
        }),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Mesajlarım"),
      ),
      body: futureBridge(
        child: messageList,
        future: msj,
      ),
    );
  }
}
