import 'package:astro/core/utils/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyle extends TextStyle {
  static TextStyle white() {
    return const TextStyle(color: Colours.white);
  }

  static TextStyle blue() {
    return const TextStyle(color: Colours.blue);
  }

  static TextStyle orange() {
    return const TextStyle(color: Colors.orange);
  }

  static TextStyle black() {
    return TextStyle(color: Colours.black);
  }

  static TextStyle grey() {
    return TextStyle(color: Colors.grey);
  }

  static TextStyle blackBold() {
    return black().merge(
      const TextStyle(
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static TextStyle blackLight() {
    return black().merge(
      const TextStyle(
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
