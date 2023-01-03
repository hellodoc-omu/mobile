import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.iconData = Icons.person,
    this.iconSize = 64,
    this.iconColor = const Color.fromRGBO(191, 234, 245, 0.7),
    this.radius = 50,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.backgroundImage,
  });

  final IconData iconData;
  final double iconSize;
  final Color iconColor;

  final double radius;
  final Color backgroundColor;
  final ImageProvider? backgroundImage;

  @override
  Widget build(BuildContext context) {
    var icon = Icon(
      iconData,
      size: iconSize,
      color: iconColor,
    );

    var avatar = CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: backgroundImage != null ? null : icon,
    );

    return Material(
      color: Colors.transparent,
      elevation: 6,
      shape: const CircleBorder(side: BorderSide.none),
      child: avatar,
    );
  }
}
