import 'package:flutter/material.dart';
import 'package:hellodoc/utilities/utilities.dart';

class ButtonedText extends StatefulWidget {
  const ButtonedText({
    super.key,
    required this.onTap,
    required this.innerText,
    this.textColor = Colors.white,
    this.textSize = 14,
    this.textDecoration = TextDecoration.underline,
  });

  final Function() onTap;
  final String innerText;

  final Color textColor;
  final double textSize;
  final TextDecoration textDecoration;

  @override
  State<ButtonedText> createState() => _ButtonedText();
}

class _ButtonedText extends State<ButtonedText> {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: widget.textColor,
      fontSize: widget.textSize,
      decoration: widget.textDecoration,
    );

    var buttonedText = Text(widget.innerText, style: textStyle);
    return bindTapEventToWidget(buttonedText, widget.onTap);
  }
}
