import 'package:flutter/material.dart';

import '../../../../constants/app_theme.dart';

class ApprovalButtonGroup extends StatelessWidget {
  const ApprovalButtonGroup(
      {required this.rejectButtonTitle,
      required this.acceptButtonTitle,
      required this.rejectButtonPressed,
      required this.acceptButtonPressed,
      Key? key})
      : super(key: key);

  final String rejectButtonTitle;
  final String acceptButtonTitle;
  final VoidCallback? rejectButtonPressed;
  final VoidCallback? acceptButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: OutlinedButton(
            style: AppTheme.outlineButtonBorderStyle,
            onPressed: rejectButtonPressed,
            child: Text(
              rejectButtonTitle,
              style: AppTheme.notoSansReg16Overlay,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: ElevatedButton(
            style: AppTheme.elevatedPrimaryActiveButtonStyle,
            onPressed: acceptButtonPressed,
            child: Text(
              acceptButtonTitle,
              style: AppTheme.notoSansReg16White,
            ),
          ),
        ),
      ],
    );
  }
}
