import 'package:flutter/material.dart';
import 'package:hellodoc/utilities/utilities.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
    required this.amIOwner,
    required this.text,
    this.softWrap = true,
    this.textPaddingH = 10,
    this.textPaddingV = 10,
    this.borderRadius = 10,
    this.messagesBetweenMarginH = 12,
    this.messagesBetweenMarginV = 4,
  });

  final bool amIOwner;
  final bool softWrap;

  final String text;
  final double textPaddingH;
  final double textPaddingV;
  final double borderRadius;

  final double messagesBetweenMarginH;
  final double messagesBetweenMarginV;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color primary = Theme.of(context).primaryColor;

    Color mBg = amIOwner ? primary : Colors.white;
    Color mtBg = amIOwner ? Colors.white : Colors.black;

    Alignment alignment =
        amIOwner ? Alignment.centerRight : Alignment.centerLeft;

    var messageBox = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: size.width),
      child: Container(
        decoration: BoxDecoration(
          color: mBg,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: textPaddingH,
          vertical: textPaddingV,
        ),
        child: Text(
          text,
          style: TextStyle(color: mtBg),
          softWrap: softWrap,
        ),
      ),
    );

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: messagesBetweenMarginH,
        vertical: messagesBetweenMarginV,
      ),
      child: Align(
        alignment: alignment,
        child: applyShadowToWidget(w: messageBox),
      ),
    );
  }
}
