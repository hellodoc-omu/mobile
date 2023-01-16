import 'package:flutter/material.dart';

Widget bindTapEventToWidget(Widget w, Function() f) {
  return GestureDetector(
    onTap: f,
    child: w,
  );
}

Widget applyShadowToWidget({required Widget w, double borderRadius = 10}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, 4),
          blurRadius: 4,
          spreadRadius: 0.2,
        ), //BoxShadow
      ],
    ),
    child: w,
  );
}

Widget futureBridge({required Function child, required Future future}) {
  return FutureBuilder(
    future: future,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return child(snapshot.data!);
      }

      return const CircularProgressIndicator();
    },
  );
}

String parseDateTimeToTime({required String datetime}) {
  final dateTime = DateTime.parse(datetime);

  return "${dateTime.hour}.${dateTime.minute}";
}
