import 'dart:math';

import 'package:flutter/material.dart';

  final Random _random = Random();

  LinearGradient randomGradient() {
    Color color1 = Color.fromARGB(
        255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));
    Color color2 = Color.fromARGB(
        255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));
    return LinearGradient(
      colors: [color1, color2],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  
class AppColors {
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color primaryOrange = Color(0xFFFF9800);
  static const Color primaryRed = Color(0xFFF44336);
  static const Color primaryPurple = Color(0xFF9C27B0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFF5F5F5);
}

double appHeight(BuildContext context) => MediaQuery.of(context).size.height;
double appWidth(BuildContext context) => MediaQuery.of(context).size.width;

const double defaultPadding = 16.0;
const double defaultMargin = 16.0;
const double defaultBorderRadius = 12.0;
const double defaultFontSize = 16.0;
const double defaultTitleFontSize = 24.0;
const double defaultIconSize = 24.0;