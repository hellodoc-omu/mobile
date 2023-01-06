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
    this.innerTextPaddingH = 10,
    this.innerTextPaddingV = 15,
    this.fitWidth = false,
    this.isActive = true,
    this.bgColor = const Color(0xFF82AAE3),
    this.inActiveBgColor = const Color(0xFFBFEAF5),
    this.borderRadius = 10,
    this.maxWidth = double.infinity,
  });

  final Function() onTap;

  final String innerText;
  final Color innerTextColor;
  final double innerTextSize;
  final FontWeight innerTextWeight;

  final double innerTextPaddingH;
  final double innerTextPaddingV;

  final bool fitWidth;

  final bool isActive;
  final Color bgColor;
  final Color inActiveBgColor;

  final double borderRadius;
  final double maxWidth;

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
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      padding: EdgeInsets.symmetric(
        horizontal: widget.innerTextPaddingH,
        vertical: widget.innerTextPaddingV,
      ),
      decoration: BoxDecoration(
        color: widget.isActive ? widget.bgColor : widget.inActiveBgColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: widget.fitWidth ? Center(child: text) : text,
    );

    var questioned = widget.fitWidth
        ? SizedBox(
            width: double.infinity,
            child: button,
          )
        : button;

    var buttonWithShadow = applyShadowToWidget(
      w: questioned,
      borderRadius: widget.borderRadius,
    );

    return widget.isActive
        ? bindTapEventToWidget(buttonWithShadow, widget.onTap)
        : buttonWithShadow;
  }
}
