import 'package:anime_alive/core/constants/color_app.dart';
import 'package:flutter/material.dart';
import 'raleway_font_weights.dart'; // import the weights

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Raleway';

  static TextStyle regular({
    double fontSize = 16,
    Color color = ColorApp.greylight,
  }) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: RalewayFontWeights.regular,
    fontSize: fontSize,
    color: color,
  );

  static TextStyle medium({
    double fontSize = 16,
    Color color = ColorApp.greylight,
  }) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: RalewayFontWeights.medium,
    fontSize: fontSize,
  );

  static TextStyle semiBold({
    double fontSize = 18,
    Color color = ColorApp.greylight,
  }) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: RalewayFontWeights.semiBold,
    fontSize: fontSize,
    color: color,
  );

  static TextStyle bold({
    double fontSize = 24,
    Color color = ColorApp.purpledark,
  }) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: RalewayFontWeights.bold,
    fontSize: fontSize,
    color: color,
  );
  static TextStyle generattag({
    double fontSize = 13,
    Color color = ColorApp.purpledark,
  }) => TextStyle(
    fontFamily: fontFamily,
    fontWeight: RalewayFontWeights.medium,
    fontSize: fontSize,
    color: color,
     shadows: [
      Shadow(
        color: Colors.black.withValues(alpha: 0.5),
        offset: Offset(0, 1),
        blurRadius: 2,
      ),
    ],
    
  );
}
