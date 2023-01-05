import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget stars(double size, bool disable) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RatingBar.builder(
        itemSize: size,
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        ignoreGestures: disable,
        unratedColor: const Color(0xffd4d4d4),

        // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          // ignore: avoid_print
          print(rating);
        },
      ),
    ],
  );
}
