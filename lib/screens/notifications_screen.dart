import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/nListTile.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreen();
}

class _NotificationsScreen extends State<NotificationsScreen> {

  var array = [
    SizedBox(height: 0),
    NotificationListTile(
      onTap: () {},
      titleText: "Yunus Emre Türk size mesaj gönderdi!",
    ),
    NotificationListTile(
      onTap: () {},
      titleText: "Berkay Gebeş size yorum yaptı!",
    ),
    NotificationListTile(
      onTap: () {},
      titleText: "Esra Türk size mesaj gönderdi!",
      isOnline: true,
    ),
  ];



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
        itemBuilder: ((context, index) {
          return array[index];
        }),
        itemCount: array.length,
      ),
    );
  }
}
