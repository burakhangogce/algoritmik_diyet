import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

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
              text: "Tarif Oluştur",
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
                        "Tariflerim",
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
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Tarif 1",
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
                          const Text(
                            "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden.",
                            style: AppTheme.notoSansMed14Primary2Text,
                          )
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
                                "Tarif 2",
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
                          const Text(
                            "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden.",
                            style: AppTheme.notoSansMed14Primary2Text,
                          )
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
