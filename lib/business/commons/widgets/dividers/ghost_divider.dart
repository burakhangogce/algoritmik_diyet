import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget(
      {required this.color,
      required this.thickness,
      required this.paddingTop,
      required this.paddingBottom,
      Key? key})
      : super(key: key);

  final Color color;
  final double thickness;
  final double paddingTop;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
      child: Divider(
        color: color,
        thickness: thickness,
      ),
    );
  }
}
