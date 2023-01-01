import 'package:flutter/material.dart';

import '../../../../../constants/app_color.dart';

class DividerWidget extends StatelessWidget {
  final String text;
  const DividerWidget(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 2,
          width: 60,
          color: primaryColor,
        ),
        const SizedBox(
          width: 9,
        ),
        Text(text),
        const SizedBox(
          width: 9,
        ),
        Container(
          height: 2,
          width: 60,
          color: primaryColor,
        ),
      ],
    );
  }
}
