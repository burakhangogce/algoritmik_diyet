import 'package:flutter/material.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../core/services/navigation_service.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12,
      child: SizedBox(
        height: 15,
        width: 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: backgroundColor,
              strokeWidth: 3,
              backgroundColor: primaryColor,
            ),
            Text(
              "Lütfen Bekleyiniz",
              textAlign: TextAlign.center,
              style: AppTheme.notoSansMed16White,
            )
          ],
        ),
      ),
    );
  }

  static openDialog() {
    return showDialog(
        barrierDismissible: false,
        context: NavigationService.navigatorKey.currentContext!,
        builder: (context) {
          return const LoadingDialog();
        });
  }

  static closeDialog() {
    Navigator.of(NavigationService.navigatorKey.currentContext!).pop();
  }
}
