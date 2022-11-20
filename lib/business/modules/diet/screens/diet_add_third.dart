import 'package:algoritmik_diyet/business/modules/diet/controller/diet_controller.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/widgets/buttons/settings_switch_list_item.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';

class DietAddThird extends StatelessWidget {
  const DietAddThird({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<DietController>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(top: pageHeight / 6, left: 12, right: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    DuoToneFontAwesomeIcon(
                        iconSource: IconFont.utensilsalt,
                        firstColor: firstIconColor,
                        iconSize: 17,
                        secondColor: secondIconColor,
                        iconSecondSource: SecondIconFont.utensilsalt),
                    TextButton(
                      onPressed: () {
                        controller.onJumpPage(1);
                      },
                      style: AppTheme.textButtonStyle,
                      child: const Text(
                        "Güncelle",
                        style: AppTheme.notoSansMed14PrimaryText,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    DuoToneFontAwesomeIcon(
                        iconSource: IconFont.running,
                        firstColor: firstIconColor,
                        iconSize: 17,
                        secondColor: secondIconColor,
                        iconSecondSource: SecondIconFont.running),
                    TextButton(
                      onPressed: () {},
                      style: AppTheme.textButtonStyle,
                      child: const Text(
                        "Bitir",
                        style: AppTheme.notoSansMed14PrimaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: firstIconColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.grey.shade300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Diyet Uzunluğu",
                        style: AppTheme.notoSansMed16PrimaryText,
                      ),
                      Text(
                        "${controller.dietMap.length} Gün",
                        style: AppTheme.notoSansMed14PrimaryText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: controller.dietMap.length < 2 ? 55 : 50 * controller.dietMap.length.toDouble(),
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.dietMap.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  DuoToneFontAwesomeIcon(
                                      iconSource: IconFont.utensilsalt,
                                      firstColor: firstIconColor,
                                      iconSize: 12,
                                      secondColor: secondIconColor,
                                      iconSecondSource: SecondIconFont.utensilsalt),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(DateFormat('EEEE, d MMM').format(controller.dietMap.keys.elementAt(index))),
                                ],
                              ),
                              Text("${controller.dietMap.values.elementAt(index).length} Öğün")
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Consumer<DietController>(builder: (BuildContext context, controller, Widget? child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Günlük Su Tüketimi",
                          style: AppTheme.notoSansMed16PrimaryText,
                        ),
                        Text(
                          "${controller.dietWaterLoop.toInt()} Litre",
                          style: AppTheme.notoSansMed16PrimaryText,
                        )
                      ],
                    ),
                  ),
                  Slider(
                    min: 1.0,
                    max: 6.0,
                    value: controller.dietWaterLoop,
                    divisions: 5,
                    label: '${controller.dietWaterLoop.round()}',
                    onChanged: (value) {
                      controller.setDietWaterLoop(value);
                    },
                  ),
                  SettingsSwitchListItem(
                    title: "Su Hatırlatıcısı",
                    isSwitched: controller.isWaterNotification,
                    onChanged: (value) {
                      controller.setNotification(value, "water");
                    },
                  ),
                  controller.isWaterNotification
                      ? Column(
                          children: [
                            Slider(
                              min: 3.0,
                              max: 12.0,
                              value: controller.dietWaterNotificationLoop,
                              divisions: 9,
                              label: '${controller.dietWaterNotificationLoop.round()}0',
                              onChanged: (value) {
                                controller.setDietWaterNotificationLoop(value);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: Text(
                                "${controller.dietWaterNotificationLoop.toInt()}0 dakikada bir hatırlatılacak.",
                                style: AppTheme.notoSansMed14Primary2Text,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 5,
                  ),
                  SettingsSwitchListItem(
                    title: "Kahve Tüketimi",
                    isSwitched: controller.isCoffeePermission,
                    onChanged: (value) {
                      controller.setNotification(value, "coffee");
                    },
                  ),
                  controller.isCoffeePermission
                      ? Column(
                          children: [
                            Slider(
                              min: 1.0,
                              max: 6.0,
                              value: controller.dietCoffeeLoop,
                              divisions: 5,
                              label: '${controller.dietCoffeeLoop.round()}',
                              onChanged: (value) {
                                controller.setDietCoffeeLoop(value);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: Text(
                                "${controller.dietCoffeeLoop.toInt()} fincan kahve içebilir.",
                                style: AppTheme.notoSansMed14Primary2Text,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 5,
                  ),
                  SettingsSwitchListItem(
                    title: "Öğün Bildirimi",
                    isSwitched: controller.isMenuNotification,
                    onChanged: (value) {
                      controller.setNotification(value, "menu");
                    },
                  ),
                  controller.isMenuNotification
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Öğünlerin 15 dakika öncesinde bildirim gönderilir.",
                            style: AppTheme.notoSansMed14Primary2Text,
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
