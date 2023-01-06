import 'package:flutter/material.dart';
import 'package:hellodoc/widgets/user_avatar.dart';

class DoctorListTile extends StatefulWidget {
  const DoctorListTile({
    super.key,
    required this.onTap,
    required this.titleText,
    required this.subTitle,
    this.trailing,
    this.titleSize = 18,
    this.titleColor = Colors.black,
    this.defaultAvatarIconSize = 32,
    this.defaultAvatarRadius = 43,
    this.contentPadding = EdgeInsets.zero,
    this.isOnline = false,
  });

  final Function() onTap;

  final String titleText;
  final double titleSize;
  final Color titleColor;

  final Widget subTitle;
  final Widget? trailing;

  final double defaultAvatarIconSize;
  final double defaultAvatarRadius;

  final EdgeInsets contentPadding;
  final bool isOnline;

  @override
  State<DoctorListTile> createState() => _DoctorListTile();
}

class _DoctorListTile extends State<DoctorListTile> {
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
      subtitle: widget.subTitle,
      trailing: widget.trailing,
      contentPadding: EdgeInsets.zero,
    );
  }
}
