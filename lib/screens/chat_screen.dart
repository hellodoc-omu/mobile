import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/mListTile.dart';
import 'package:hellodoc/widgets/message_box.dart';
import 'package:hellodoc/widgets/textbox.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var appBarItem = MessageListTile(
      titleText: "Yunus Emre Türk",
      titleColor: Colors.white,
      subTitleText: "Çevrimiçi",
      subTitleColor: Colors.white.withOpacity(0.7),
      onTap: () {},
      defaultAvatarRadius: 20,
      defaultAvatarIconSize: 20,
    );

    var messagesList = SingleChildScrollView(
      child: Column(
        children: const [
          MessageBox(
            amIOwner: false,
            text: "Merhaba doktor bey",
          ),
          MessageBox(
            amIOwner: true,
            text: "Merhaba",
          ),
          MessageBox(
            amIOwner: true,
            text: "Şikayetiniz nedir?",
          ),
          MessageBox(
            amIOwner: false,
            text: "Belim çok ağrıyor ne yapabilirim?",
          ),
          MessageBox(
            amIOwner: true,
            text: "🤷‍♂️",
          ),
        ],
      ),
    );

    var controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: appBarItem,
      ),
      backgroundColor: colors["meBg"],
      body: Column(
        children: [
          Expanded(child: messagesList),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Textbox(
                  controller: controller,
                  validator: (String? value) => null,
                  hintText: "Buraya yazınız...",
                  borderColor: Colors.black.withOpacity(0.25),
                  borderRadius: 7,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  trailings: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.attach_file),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.camera_alt),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              FloatingActionButton(
                onPressed: () {},
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
