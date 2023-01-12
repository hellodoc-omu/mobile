import 'package:flutter/material.dart';
import 'package:hellodoc/helpers/variable_breakpoints.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.iconData = Icons.person,
    this.iconSize = 64,
    this.iconColor = const Color.fromRGBO(191, 234, 245, 0.7),
    this.radius = 50,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.backgroundImage,
    this.isOnline = false,
  });

  final IconData iconData;
  final double iconSize;
  final Color iconColor;

  final double radius;
  final Color backgroundColor;
  final String? backgroundImage;

  final bool isOnline;

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
      backgroundImage:
          backgroundImage != null ? NetworkImage(backgroundImage!) : null,
      child: backgroundImage != null ? null : icon,
    );

    var avatarWithShadow = Material(
      color: Colors.transparent,
      elevation: 2,
      shape: const CircleBorder(side: BorderSide.none),
      child: avatar,
    );

    var onlineStateCircle = SizedBox(
      width: radius * 1.1,
      child: CircleAvatar(
        radius: radius / 4,
        backgroundColor: colors["avaOnline"],
      ),
    );

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        avatarWithShadow,
        isOnline ? onlineStateCircle : const SizedBox.shrink(),
      ],
    );
  }
}
