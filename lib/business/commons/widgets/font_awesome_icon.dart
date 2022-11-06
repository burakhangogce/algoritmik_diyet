import 'package:flutter/material.dart';

class FontAwesomeIcon extends IconData {
  const FontAwesomeIcon(
      {Key? key,
      required this.iconSource,
      this.iconFont = "fontAwesomeProRegular"})
      : super(iconSource, fontFamily: iconFont);
  final int iconSource;
  final String iconFont;
}
