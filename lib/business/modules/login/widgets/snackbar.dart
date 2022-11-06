import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../constants/enums/message_box_state.dart';
import '../../../../constants/localization.dart';
import '../../../commons/widgets/boxes/message_box.dart';

void showSnackbar(context) {
  showTopSnackBar(
    context,
    padding: EdgeInsets.zero,
    Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(15),
      child: MessageBox(
          state: MessageBoxState.unsuccess,
          message: Localization.of(context)!.signin_company_invalid_login),
    ),
    dismissType: DismissType.onSwipe,
    dismissDirection: DismissDirection.none,
  );
}
