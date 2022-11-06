import 'package:flutter/material.dart';

import '../../../../constants/app_theme.dart';

class GeneralTitle extends StatelessWidget {
  final Widget? leadingIcon;
  final String title;
  final Widget? trailingIcon;

  const GeneralTitle({
    Key? key,
    this.leadingIcon,
    required this.title,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: leadingIcon ?? const SizedBox(width: 25, height: 25)),
          Align(
            alignment: Alignment.center,
            child: Text(title,
                style: AppTheme.notoSansMed18White,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: trailingIcon ?? const SizedBox(width: 25, height: 25)),
        ],
      ),
    );
  }
}
