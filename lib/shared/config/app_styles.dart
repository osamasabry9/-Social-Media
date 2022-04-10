// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static const TextStyle paragraph1 = TextStyle(
      fontSize: 16,
      fontFamily: "Jannah",
      color: Colors.white,
      fontWeight: FontWeight.w400);

  static const TextStyle hdr = TextStyle(
      fontSize: 21,
      fontFamily: "Jannah",
      color: Colors.white,
      fontWeight: FontWeight.w600);

  static const TextStyle headline = TextStyle(
      fontSize: 21,
      fontFamily: "Jannah",
      color: Colors.black,
      fontWeight: FontWeight.w600);

  static const TextStyle description = TextStyle(
      fontSize: 15,
      fontFamily: "Jannah",
      color: Colors.black,
      fontWeight: FontWeight.w300);

  static const TextStyle input_label = TextStyle(
      fontSize: 14,
      fontFamily: "Jannah",
      color: AppColors.LABEL,
      fontWeight: FontWeight.w300);
}
