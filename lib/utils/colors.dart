import 'package:flutter/material.dart';

const kBlack = Colors.black;
const kBlack54 = Colors.black54;

const kWhite = Colors.white;

BoxDecoration gradientcolor() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromARGB(232, 70, 255, 209),
        Color.fromARGB(255, 0, 0, 0),
      ],
    ),
  );
}
