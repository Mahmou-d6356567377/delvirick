import 'package:delvirick/core/utils/consts/colors.dart';
import 'package:delvirick/core/utils/consts/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConstFonts {
  static TextStyle fonttnormallight = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: ConstText.appfontfamily,
    color: Colors.white,
  );
  static TextStyle fontboldblack = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: ConstText.appfontfamily,
    color: Colors.black,
  );

  static TextStyle fontnormalgray = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: ConstText.appfontfamily,
    color: ConstColors.grey,
  );

  static TextStyle fontboldgreen = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  );
}
