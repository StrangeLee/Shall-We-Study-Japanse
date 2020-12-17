
import 'package:flutter/material.dart';

class CustomTextStyle {

  static TextStyle get defaultText => const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get quizText => const TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get answerText => const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.normal,
  );
}