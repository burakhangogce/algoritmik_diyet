import 'package:algoritmik_diyet/business/commons/widgets/font_awesome_icon.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class DuoToneFontAwesomeIcon extends StatelessWidget {
  const DuoToneFontAwesomeIcon(
      {Key? key,
      required this.iconSource,
      required this.iconSecondSource,
      this.iconSize,
      this.firstColor,
      this.secondColor})
      : super(key: key);
  final int iconSource;
  final int iconSecondSource;
  final double? iconSize;
  final Color? firstColor;
  final Color? secondColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Icon(
              FontAwesomeIcon(
                iconSource: iconSource,
                iconFont: "fontAwesomeDuoTone",
              ),
              color: firstColor ?? primaryColor,
              size: iconSize),
        ),
        Center(
          child: Icon(
              FontAwesomeIcon(
                iconSource: iconSecondSource,
                iconFont: "fontAwesomeDuoTone",
              ),
              color: secondColor ?? primaryColor,
              size: iconSize),
        ),
      ],
    );
  }
}
