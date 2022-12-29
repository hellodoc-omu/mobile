import 'package:flutter/material.dart';
import 'package:hellodoc/utilities/utilities.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.innerText,
    this.innerTextColor = Colors.white,
    this.innerTextSize = 24,
    this.innerTextWeight = FontWeight.w700,
    this.innerTextPaddingV = 15,
    this.fitWidth = false,
    this.bgColor = const Color(0xFF82AAE3),
    this.shadowWidth = 10,
    this.borderRadius = 10,
  });

  final Function() onTap;

  final String innerText;
  final Color innerTextColor;
  final double innerTextSize;
  final FontWeight innerTextWeight;

  final double innerTextPaddingV;

  final bool fitWidth;

  final Color bgColor;
  final double shadowWidth;
  final double borderRadius;

  @override
  State<CustomButton> createState() => _CustomButton();
}

class _CustomButton extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: widget.innerTextColor,
      fontSize: widget.innerTextSize,
      fontWeight: widget.innerTextWeight,
    );

    var text = Text(
      widget.innerText,
      style: textStyle,
    );

    var button = Container(
      padding: EdgeInsets.symmetric(vertical: widget.innerTextPaddingV),
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Center(child: text),
    );

    var buttonWithShadow = Material(
      color: Colors.transparent,
      elevation: widget.shadowWidth,
      child: widget.fitWidth
          ? SizedBox(
              width: double.infinity,
              child: button,
            )
          : button,
    );

    return bindTapEventToWidget(buttonWithShadow, widget.onTap);
  }
}
