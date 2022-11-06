import 'package:flutter/material.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton(
      {Key? key,
      this.isEnable = true,
      required this.text,
      this.icon,
      required this.onClicked,
      this.primary})
      : super(key: key);

  final bool isEnable;
  final String text;
  final Widget? icon;
  final VoidCallback? onClicked;
  final Color? primary;

  get primaryColor => null;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnable ? onClicked : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: primary ?? primaryColor,
      ),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                const SizedBox(
                  width: 11,
                ),
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: isEnable ? Colors.white : Colors.grey),
                ),
              ],
            )
          : Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: isEnable ? Colors.white : Colors.grey),
            ),
    );
  }
}
