import 'package:flutter/material.dart';

import '../../../../constants/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;
  final ButtonStyle? style;
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: style ?? Theme.of(context).elevatedButtonTheme.style,
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ?? Theme.of(context).textTheme.labelLarge,
        ));
  }
}

class PrimaryGhostButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryGhostButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: onPressed,
      text: text,
      textStyle: Theme.of(context).textTheme.labelLarge,
      style: AppTheme.elevatedButtonStyle,
    );
  }
}
