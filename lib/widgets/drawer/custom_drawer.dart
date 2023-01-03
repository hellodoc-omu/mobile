import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';
import 'package:hellodoc/widgets/drawer/drawer_header.dart';
import 'package:hellodoc/widgets/listtile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<StatefulWidget> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    var arrowButton = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          color: colors["primary"],
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          header("Berkay Gebeş", "bgebes@gmail.com"),
          listTile('Profilim', Icons.account_box_sharp),
          listTile('Mesajlarım', Icons.message_sharp),
          listTile('Bildirimlerim', Icons.notifications),
          listTile('Ayarlarım', Icons.settings),
          listTile('Yardım', Icons.help_center),
          listTile('Çıkış Yap', Icons.logout),
          arrowButton
        ],
      ),
    );
  }
}
