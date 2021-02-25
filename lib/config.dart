import 'package:ucondo_flutter/imports.dart';

configApp() {
  _initStyles();
  _initMessages();
}

_initStyles() {

  // Label
  AppLabelStyle.size = 16;
  AppLabelStyle.color = Colors.white;

  // Button
  AppButtonStyle.color = AppColors.green_button;
  AppButtonStyle.height = 40;
  AppButtonStyle.borderRadius = 0;

  // Text
  AppTextStyle.textFontSize = 16;
  AppTextStyle.hintFontSize = 16;
  AppTextStyle.textColor = Colors.white;
  AppTextStyle.fillColor = Colors.white;

}

_initMessages() {

}