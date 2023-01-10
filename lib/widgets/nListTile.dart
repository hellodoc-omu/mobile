import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/user_avatar.dart';

class NotificationListTile extends StatefulWidget {
  const NotificationListTile({
    super.key,
    required this.onTap,
    required this.titleText,
    this.trailing,
    this.titleSize = 16,
    this.titleColor = Colors.black,
    this.defaultAvatarIconSize = 40,
    this.defaultAvatarRadius = 45,
    this.contentPadding = EdgeInsets.zero,
    this.isOnline = false,
  });

  final Function() onTap;

  final String titleText;
  final double titleSize;
  final Color titleColor;

  final Widget? trailing;

  final double defaultAvatarIconSize;
  final double defaultAvatarRadius;

  final EdgeInsets contentPadding;
  final bool isOnline;

  @override
  State<NotificationListTile> createState() => _NotificationListTile();
}

class _NotificationListTile extends State<NotificationListTile> {
  @override
  Widget build(BuildContext context) {
    var titleStyle = TextStyle(
      color: widget.titleColor,
      fontSize: widget.titleSize,
    );

    return ListTile(
      onTap: widget.onTap,
      leading: UserAvatar(
        iconSize: widget.defaultAvatarIconSize,
        radius: widget.defaultAvatarRadius,
        isOnline: widget.isOnline,
      ),
      title: Text(widget.titleText, style: titleStyle),
      trailing: widget.trailing,
      contentPadding: EdgeInsets.zero,
    );
  }
}
