import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/mListTile.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreen();
}

class _NotificationsScreen extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Bildirimlerim"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.black.withOpacity(0.1), thickness: 1);
        },
        itemCount: 1,
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
