import 'package:flutter/material.dart';

Widget bindTapEventToWidget(Widget w, Function() f) {
  return GestureDetector(
    onTap: f,
    child: w,
  );
}
