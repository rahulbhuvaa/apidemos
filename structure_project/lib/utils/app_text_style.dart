import 'package:flutter/material.dart';

enum FW { regular, medium, semiBold, bold, extraBold }

FontWeight? getFW(FW? fw) {
  switch (fw) {
    case FW.regular:
      return FontWeight.w400;
    case FW.medium:
      return FontWeight.w500;
    case FW.semiBold:
      return FontWeight.w600;
    case FW.bold:
      return FontWeight.w700;
    case FW.extraBold:
      return FontWeight.w800;
    default:
      return FontWeight.w400;
  }
}

const String exoFontFamily = "Exo";

TextStyle size3({
  FW? fw,
  Color? fontColor,
  String? fontFamily,
}) {
  return TextStyle(fontSize: 3, fontWeight: getFW(FW.bold), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size5({
  FW? fw,
  Color? fontColor,
  String? fontFamily,
}) {
  return TextStyle(fontSize: 5, fontWeight: getFW(FW.bold), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size8({
  FW? fw,
  Color? fontColor,
  String? fontFamily,
}) {
  return TextStyle(fontSize: 8, fontWeight: getFW(FW.bold), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size9({
  FW? fw,
  Color? fontColor,
  String? fontFamily,
}) {
  return TextStyle(fontSize: 9, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size10({
  FW? fw,
  Color? fontColor,
  String? fontFamily,
}) {
  return TextStyle(fontSize: 10, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size11({
  FW? fw,
  Color? fontColor,
  String? fontFamily,
}) {
  return TextStyle(fontSize: 11, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size12({FW? fw, Color? fontColor, String? fontFamily, TextDecoration? decoration}) {
  return TextStyle(decoration: decoration ?? TextDecoration.none, fontSize: 12, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size13({FW? fw, Color? fontColor, String? fontFamily, TextDecoration? decoration}) {
  return TextStyle(decoration: decoration ?? TextDecoration.none, fontSize: 13, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size14({FW? fw, Color? fontColor, String? fontFamily, TextDecoration? decoration}) {
  return TextStyle(decoration: decoration ?? TextDecoration.none, fontSize: 14, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size15({FW? fw, Color? fontColor, String? fontFamily}) {
  return TextStyle(fontSize: 15, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size17({FW? fw, Color? fontColor, String? fontFamily}) {
  return TextStyle(fontSize: 17, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size16({FW? fw, Color? fontColor, String? fontFamily}) {
  return TextStyle(fontSize: 16, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size18({FW? fw, Color? fontColor, String? fontFamily}) {
  return TextStyle(fontSize: 18, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size20({FW? fw, Color? fontColor, String? fontFamily}) {
  return TextStyle(fontSize: 20, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size22({FW? fw, Color? fontColor, String? fontFamily}) {
  return TextStyle(fontSize: 22, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size24({FW? fw, Color? fontColor, String? fontFamily}) {
  return TextStyle(fontSize: 24, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size34({FW? fw, Color? fontColor, String? fontFamily}) {
  return TextStyle(fontSize: 34, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}

TextStyle size44({FW? fw, Color? fontColor, String? fontFamily}) {
  return TextStyle(fontSize: 44, fontWeight: getFW(fw), color: fontColor ?? Colors.black, fontFamily: fontFamily ?? exoFontFamily);
}
