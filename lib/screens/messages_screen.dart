import 'package:flutter/material.dart';
import 'package:hellodoc/actions/actions.dart';
import 'package:hellodoc/models/relationals/mesaj.dart';
import 'package:hellodoc/screens/chat_screen.dart';
import 'package:hellodoc/utilities/utilities.dart';
import 'package:hellodoc/widgets/mListTile.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, required this.amIDoctor, required this.kNo});

  final bool amIDoctor;

  // Hastaysa hNo, doktorsa dNo degeri verilecektir. Ortak olarak tutuldu.
  final int kNo;

  @override
  State<MessagesScreen> createState() => _MessagesScreen();
}

class _MessagesScreen extends State<MessagesScreen> {
  late Future<List<Mesaj>> mesajlar;

  @override
  void initState() {
    mesajlar = fetchMessages(
      dNo: widget.amIDoctor ? widget.kNo : null,
      hNo: widget.amIDoctor ? null : widget.kNo,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void fetchMsg() {
      mesajlar = fetchMessages(
        dNo: widget.amIDoctor ? widget.kNo : null,
        hNo: widget.amIDoctor ? null : widget.kNo,
      );
    }

    Widget messageList(List<Mesaj> msjList) {
      List<String> ikililer = [];

      return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.black.withOpacity(0.1), thickness: 1);
        },
        itemCount: msjList.length,
        itemBuilder: ((context, index) {
          Mesaj m = msjList[index];
          String ikili = "${m.doktor["no"]}-${m.hasta["no"]}";

          if (ikililer.contains(ikili)) return const SizedBox.shrink();
          ikililer.add(ikili);

          dynamic opposite = widget.amIDoctor ? m.hasta : m.doktor;

          return MessageListTile(
            avatar: opposite["avatar"],
            titleText: opposite["isimSoyisim"],
            subTitleText: m.icerik,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return ChatScreen(
                  opposite: opposite,
                  amIDoctor: widget.amIDoctor,
                  dNo: widget.amIDoctor ? widget.kNo : opposite["no"],
                  hNo: widget.amIDoctor ? opposite["no"] : widget.kNo,
                );
              })));
            },
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
        future: mesajlar,
      ),
    );
  }
}
