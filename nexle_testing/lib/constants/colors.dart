import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color pinkParty = Color(0xFFFF59EE);
  static const Color deepDenim = Color(0xFF647FFF);
  static const Color flutshed = Color(0xFFE05151);
  static const Color indiaTrade = Color(0xFFE3A063);
  static const Color algaeGreen = Color(0xFF91E2B7);
  static const Color pleasantPurple = Color(0xFF8A32A9);
  static const Color purpleClimax = Color(0xFF8A00FF);
  static const Color violetFemmes = Color(0xFFA86DA6);
  static const Color rosyCheeks = Color(0xFFDA4F6B);
  static const Color clearWeather = Color(0xFF6ABAE0);
  static const Color dazzlingBlue = Color(0xFF3955A4);

  static Color fromHex(String hexString) {
    final StringBuffer buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
