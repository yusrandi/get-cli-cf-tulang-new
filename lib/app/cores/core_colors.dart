import 'package:flutter/material.dart';

class CoreColor {
  static Color primary = Color(0xFF84A1CF);
  static Color primarySoft = Color(0xFF0B5551);
  static Color primaryExtraSoft = Color(0xFFEEF4F4);
  static Color secondary = Color(0xFFEDE5CC);
  static Color whiteSoft = Color(0xFFF5F5F5);
  static Color kTextColor = Color(0xFF757575);
  static Color kHintTextColor = Color(0xFFBB9B9B9);

  static LinearGradient bottomShadow = LinearGradient(colors: [
    Color(0xFF107873).withOpacity(0.5),
    Color(0xFF107873).withOpacity(0.2)
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  static LinearGradient bottomShadowShoft = LinearGradient(colors: [
    Color(0xFF107873).withOpacity(0.2),
    Color(0xFF107873).withOpacity(0.2)
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  static LinearGradient linearBlackBottom = LinearGradient(
      colors: [Colors.black.withOpacity(0.45), Colors.black.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  static LinearGradient linearBlackTop = LinearGradient(
      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}
