import 'package:flutter/material.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_theme.dart';
import '../../../../commons/utils/icon_font.dart';
import '../../../../commons/utils/second_icon_font.dart';
import '../../../../commons/widgets/duo_tone_font_Awesome_icon.dart';

class ClientHomeMenuWidget extends StatelessWidget {
  const ClientHomeMenuWidget({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: !index.isEven ? softBackgroundColor : Colors.green.shade50,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            color: !index.isEven ? softBackgroundColor : Colors.green.shade50),
        child: SizedBox(
          width: 170,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hafif kahvaltı",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTheme.notoSansMed14PrimaryText,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Menü detayı kısa",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTheme.notoSansMed12PrimaryText
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DuoToneFontAwesomeIcon(
                        iconSource: IconFont.alarmclock,
                        firstColor: firstIconColor,
                        iconSize: 16,
                        secondColor: secondIconColor,
                        iconSecondSource: SecondIconFont.alarmclock),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "19:30 - 20:00",
                      style: AppTheme.notoSansMed12Primary2Text,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
