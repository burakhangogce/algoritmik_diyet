import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';

class Client extends StatelessWidget {
  const Client({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            height: pageHeight / 10,
          ),
          SizedBox(
            width: pageWidht * 0.9,
            child: PrimaryButton(
              onPressed: () {},
              text: "Danışan Ekle",
              textStyle: AppTheme.notoSansMed18White,
              style: AppTheme.elevatedButtonStyle,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: firstIconColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                color: Colors.grey.shade300),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Danışanlarım",
                        style: AppTheme.notoSansMed16PrimaryText,
                      ),
                      Text(
                        "2 Adet",
                        style: AppTheme.notoSansMed16PrimaryText,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Danışan 1",
                            style: AppTheme.notoSansMed14PrimaryText,
                          ),
                          DuoToneFontAwesomeIcon(
                              iconSource: IconFont.edit,
                              firstColor: firstIconColor,
                              iconSize: 20,
                              secondColor: secondIconColor,
                              iconSecondSource: SecondIconFont.edit),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Danışan 2",
                            style: AppTheme.notoSansMed14PrimaryText,
                          ),
                          DuoToneFontAwesomeIcon(
                              iconSource: IconFont.edit,
                              firstColor: firstIconColor,
                              iconSize: 20,
                              secondColor: secondIconColor,
                              iconSecondSource: SecondIconFont.edit),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
