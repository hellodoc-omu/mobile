import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/user_avatar.dart';

class MessageListTile extends StatefulWidget {
  const MessageListTile({
    super.key,
    required this.onTap,
    required this.titleText,
    required this.subTitleText,
    this.titleSize = 18,
    this.titleColor = Colors.black,
    this.subTitleSize = 14,
    this.subTitleColor = const Color.fromRGBO(0, 0, 0, 0.7),
    this.avatar,
    this.defaultAvatarIconSize = 32,
    this.defaultAvatarRadius = 43,
    this.contentPadding = EdgeInsets.zero,
    this.isOnline = false,
  });

  final Function() onTap;

  final String titleText;
  final double titleSize;
  final Color titleColor;

  final String subTitleText;
  final double subTitleSize;
  final Color subTitleColor;

  final String? avatar;
  final double defaultAvatarIconSize;
  final double defaultAvatarRadius;

  final EdgeInsets contentPadding;
  final bool isOnline;

  @override
  State<MessageListTile> createState() => _MessageListTile();
}

class _MessageListTile extends State<MessageListTile> {
  @override
  Widget build(BuildContext context) {
    var titleStyle = TextStyle(
      color: widget.titleColor,
      fontSize: widget.titleSize,
    );

    var subTitleStyle = TextStyle(
      color: widget.subTitleColor,
      fontSize: widget.subTitleSize,
    );

    return ListTile(
      onTap: widget.onTap,
      leading: UserAvatar(
        iconSize: widget.defaultAvatarIconSize,
        radius: widget.defaultAvatarRadius,
        backgroundImage: widget.avatar,
        isOnline: widget.isOnline,
      ),
      title: Text(widget.titleText, style: titleStyle),
      subtitle: Text(widget.subTitleText, style: subTitleStyle),
      contentPadding: EdgeInsets.zero,
    );
  }
}
