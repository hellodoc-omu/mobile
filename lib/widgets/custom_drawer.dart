import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/arrow.dart';
import 'package:hellodoc/widgets/drawer_header.dart';
import 'package:hellodoc/widgets/listtile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<StatefulWidget> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          header,
          listTile('Profilim', Icons.account_box_sharp),
          listTile('Mesajlarım', Icons.message_sharp),
          listTile('Bildirimlerim', Icons.notifications),
          listTile('Ayarlarım', Icons.settings),
          listTile('Yardım', Icons.settings),
          listTile('Çıkış Yap', Icons.logout),
          arrow(Icons.arrow_back)
        ],
      ),
    );
  }
}
