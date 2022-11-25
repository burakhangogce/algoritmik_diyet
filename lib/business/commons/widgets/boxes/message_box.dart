import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../constants/enums/message_box_state.dart';
import '../../utils/icon_font.dart';
import '../../utils/second_icon_font.dart';
import '../duo_tone_font_Awesome_icon.dart';

class MessageBox extends StatelessWidget {
  const MessageBox(
      {Key? key,
      required this.message,
      this.backgroundColor = Colors.white,
      this.padding = EdgeInsets.zero,
      this.state = MessageBoxState.infromation})
      : super(key: key);

  final String message;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final MessageBoxState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: cardBorderColor),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: cardShadowColor,
            blurRadius: 6.0,
            spreadRadius: 0.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 17.5, bottom: 17.5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DuoToneFontAwesomeIcon(
                iconSource: IconFont.infocircle,
                firstColor: firstIconColor,
                iconSize: 25,
                secondColor: secondIconColor,
                iconSecondSource: SecondIconFont.infocircle),
            const SizedBox(width: 6),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: DefaultTextStyle(
                  style: AppTheme.notoSansReg14PrimaryText,
                  child: Text(message),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
