import 'package:flutter/material.dart';

class Textbox extends StatefulWidget {
  const Textbox(
      {super.key,
      required this.controller,
      required this.validator,
      required this.hintText,
      this.hintSize = 16,
      this.hintColor = const Color.fromRGBO(0, 0, 0, 0.7),
      this.fill = true,
      this.fillColor = Colors.white,
      this.borderColor = Colors.transparent,
      this.borderRadius = 10,
      this.shadowWidth = 10,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      this.obscureText = false});

  final TextEditingController controller;
  final String? Function(String?)? validator;

  final String hintText;
  final double hintSize;
  final Color hintColor;

  final bool fill;
  final Color fillColor;

  final Color borderColor;
  final double borderRadius;
  final double shadowWidth;
  final EdgeInsets contentPadding;

  final bool obscureText;

  @override
  State<Textbox> createState() => _Textbox();
}

class _Textbox extends State<Textbox> {
  @override
  Widget build(BuildContext context) {
    var inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );

    var hintStyle = TextStyle(
      color: widget.hintColor,
      fontSize: widget.hintSize,
    );

    var inputDecoration = InputDecoration(
      border: inputBorder,
      filled: widget.fill,
      fillColor: widget.fillColor,
      hintStyle: hintStyle,
      hintText: widget.hintText,
      contentPadding: widget.contentPadding,
    );

    return Material(
      color: Colors.transparent,
      elevation: widget.shadowWidth,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.obscureText,
        decoration: inputDecoration,
      ),
    );
  }
}
