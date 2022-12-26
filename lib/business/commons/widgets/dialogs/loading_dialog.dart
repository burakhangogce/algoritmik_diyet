import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../constants/api_path.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/99276-loading-utensils.json',
            width: pageWidht * 0.95,
            height: pageHeight * 0.50,
          ),
          Center(
            child: Text(
              "Lütfen Bekleyiniz",
              textAlign: TextAlign.center,
              style: AppTheme.notoSansMed16White,
            ),
          )
        ],
      ),
    );
  }

  static openDialog() {
    return showDialog(
        barrierDismissible: false,
        context: NavigationService.instance!.navigatorKey.currentContext!,
        builder: (context) {
          return const LoadingDialog();
        });
  }

  static closeDialog() {
    navigatorKey.currentState!.pop();
  }
}
