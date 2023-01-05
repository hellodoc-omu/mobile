import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/mListTile.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreen();
}

class _MessagesScreen extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Mesajlarım"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.black.withOpacity(0.1), thickness: 1);
        },
        itemCount: 5,
        itemBuilder: ((context, index) {
          return MessageListTile(
            titleText: "Yunus Emre Türk",
            subTitleText: "Merhaba doktor bey",
            onTap: () {},
          );
        }),
      ),
    );
  }
}
