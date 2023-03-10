import 'package:flutter/material.dart';
import 'package:hellodoc/actions/actions.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/models/relationals/mesaj.dart';
import 'package:hellodoc/socket/connection.dart';
import 'package:hellodoc/utilities/utilities.dart';
import 'package:hellodoc/widgets/mListTile.dart';
import 'package:hellodoc/widgets/message_box.dart';
import 'package:hellodoc/widgets/textbox.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.opposite,
    required this.amIDoctor,
    required this.dNo,
    required this.hNo,
  });

  final dynamic opposite;
  final bool amIDoctor;
  final int dNo;
  final int hNo;

  @override
  State<ChatScreen> createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  late int dUzNo;
  late Future<List<Mesaj>> mesajlar;
  SocketConn socketConn = SocketConn();

  @override
  void initState() {
    mesajlar = fetchMessages(
      hNo: widget.hNo,
      dNo: widget.dNo,
      gorusme: true,
    );
    socketConn.connectSocket();

    super.initState();
  }

  @override
  void dispose() {
    socketConn.disconnectSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void fetchMsg() {
      mesajlar = fetchMessages(
        hNo: widget.hNo,
        dNo: widget.dNo,
        gorusme: true,
      );
    }

    socketConn.getEventFromServer("receiveMessages", (data) {
      setState(() {
        fetchMsg();
      });
    });

    var appBarItem = MessageListTile(
      titleText: widget.opposite["isimSoyisim"],
      titleColor: Colors.white,
      subTitleText: widget.opposite["online"] == 1 ? "Çevrimiçi" : "Çevrimdışı",
      subTitleColor: Colors.white.withOpacity(0.7),
      onTap: () {},
      avatar: widget.opposite["avatar"],
      isOnline: widget.opposite["online"] == 1,
      defaultAvatarRadius: 20,
      defaultAvatarIconSize: 20,
    );

    final ScrollController scrollController = ScrollController();

    void scrollDown() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    }

    Widget messagesList(List<Mesaj> mesajlar) {
      dUzNo = mesajlar[0].doktor["dUzNo"];
      String charSymbol = widget.amIDoctor ? "D" : "H";

      return ListView.builder(
        controller: scrollController,
        itemCount: mesajlar.length,
        itemBuilder: ((context, index) {
          WidgetsBinding.instance.addPostFrameCallback((_) => scrollDown());

          return MessageBox(
            isSenderMe: mesajlar[index].gonderen == charSymbol,
            text: mesajlar[index].icerik,
            time: parseDateTimeToTime(datetime: mesajlar[index].tarih),
          );
        }),
      );
    }

    GlobalKey<FormState>? formKey = GlobalKey<FormState>();
    var controller = TextEditingController();
    String? validator(String? value) {
      if (value == null || value.isEmpty) {
        return "Boş mesaj gönderemezsiniz";
      }

      return null;
    }

    return Scaffold(
      appBar: AppBar(title: appBarItem),
      backgroundColor: colors["meBg"],
      body: Column(
        children: [
          Expanded(child: futureBridge(child: messagesList, future: mesajlar)),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Form(
                  key: formKey,
                  child: Textbox(
                    controller: controller,
                    validator: validator,
                    hintText: "Buraya yazınız...",
                    borderColor: Colors.black.withOpacity(0.25),
                    borderRadius: 7,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              FloatingActionButton(
                onPressed: () async {
                  bool val = formKey.currentState!.validate();
                  if (!val) return;

                  var res = await sendMessage(
                    icerik: controller.text,
                    gonderen: widget.amIDoctor ? 'D' : 'H',
                    dNo: widget.dNo,
                    dUzNo: dUzNo,
                    hNo: widget.hNo,
                  );

                  if (res["status"] == "success") {
                    socketConn.sendEventToServer("sendMessage", []);
                  } else {
                    throw Exception("Message did not send");
                  }
                },
                backgroundColor: colors["primary"],
                child: const Icon(Icons.send),
              )
            ],
          ),
        ],
      ),
    );
  }
}
