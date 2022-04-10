// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
//255,114,94
class AppColors {
  static const Color MAIN = Color(0xff27ae68);
  // ignore: non_constant_identifier_names
  static  Color MAINTOW = const Color.fromRGBO(255,114,94,1);
  //static const Color MAINTOW = HexColor('FF725E');
  
  static const Color LABEL = Color(0xffc1c7d0);
  static const Color INPUT_FIELD_BG = Color(0xfff4f5f7);
  static const kSecondaryColor = Color(0xFF8B94BC);
  static const kGreenColor = Color(0xFF6AC259);
  static const kRedColor = Color(0xFFE92E30);
  static const kGrayColor = Color(0xFFC1C1C1);
  static const kBlackColor = Color(0xFF101010);

  static const kPrimaryGradient = LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const kPrimaryGradient2 = LinearGradient(
    colors: [
      Color.fromARGB(255, 143, 149, 253),
      Color.fromARGB(153, 64, 67, 253),
    ],
  );
}
