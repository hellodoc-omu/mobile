import 'package:flutter/material.dart';
import 'package:hellodoc/utilities/utilities.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    super.key,
    required this.isSenderDoctor,
    required this.text,
    required this.time,
    this.softWrap = true,
    this.textPaddingH = 10,
    this.textPaddingV = 10,
    this.borderRadius = 10,
    this.messagesBetweenMarginH = 12,
    this.messagesBetweenMarginV = 4,
  });

  final bool isSenderDoctor;
  final bool softWrap;

  final String text;
  final double textPaddingH;
  final double textPaddingV;
  final double borderRadius;

  final String time;

  final double messagesBetweenMarginH;
  final double messagesBetweenMarginV;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color primary = Theme.of(context).primaryColor;

    Color mBg = isSenderDoctor ? primary : Colors.white;
    Color mtColor = isSenderDoctor ? Colors.white : Colors.black;

    Alignment alignment =
        isSenderDoctor ? Alignment.centerRight : Alignment.centerLeft;

    var messageBox = Container(
      constraints: BoxConstraints(maxWidth: size.width),
      decoration: BoxDecoration(
        color: mBg,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: textPaddingH,
        vertical: textPaddingV,
      ),
      child: IntrinsicWidth(
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(color: mtColor),
              softWrap: softWrap,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                time,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
                  color: mtColor.withOpacity(0.5),
                ),
              ),
            )
          ],
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
