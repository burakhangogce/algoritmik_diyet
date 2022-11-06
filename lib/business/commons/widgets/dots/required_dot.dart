import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class RequiredDot extends StatelessWidget {
  const RequiredDot({this.dotColor = errorColor, this.size = 10, Key? key})
      : super(key: key);
  final Color dotColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: dotColor,
          borderRadius: BorderRadius.all(Radius.circular(size / 2))),
    );
  }
}
