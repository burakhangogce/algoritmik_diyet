import 'package:algoritmik_diyet/business/models/diet/diet_model.dart';
import 'package:algoritmik_diyet/business/modules/diet/controller/diet_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../main.dart';
import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/utils/validations.dart';
import '../../../commons/widgets/buttons/settings_switch_list_item.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';
import '../../../commons/widgets/textformfields/general_text_form_field.dart';

class DietAddSecond extends StatelessWidget {
  const DietAddSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: pageHeight / 6),
      child: Consumer<DietController>(builder: (BuildContext context, controller, Widget? child) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      //controller.addSetDietDetailWidget(controller.selectedDietDate);
                      showAddDietSheet(controller);
                    },
                    style: AppTheme.textButtonStyle,
                    child: const Text(
                      "Ekle",
                      style: AppTheme.notoSansMed14PrimaryText,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  DuoToneFontAwesomeIcon(
                      iconSource: IconFont.paste,
                      firstColor: firstIconColor,
                      iconSize: 17,
                      secondColor: secondIconColor,
                      iconSecondSource: SecondIconFont.paste),
                  TextButton(
                    onPressed: () {
                      controller.pasteDietMenu(controller.selectedDietDate);
                    },
                    style: AppTheme.textButtonStyle,
                    child: const Text(
                      "Yapıştır",
                      style: AppTheme.notoSansMed14PrimaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 45,
            width: pageWidht * 0.9,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.selectedDateList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: GestureDetector(
                    onTap: () {
                      controller.setSelectedDietDate(index);
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: firstIconColor,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                          color: index == controller.selectedDietDate ? Colors.grey.shade300 : Colors.transparent),
                      child: Column(
                        children: [
                          Text(
                            controller.selectedDateList[index].day.toString(),
                            style: AppTheme.notoSansMed12PrimaryText,
                          ),
                          Text(DateFormat('EE').format(controller.selectedDateList[index]),
                              style: AppTheme.notoSansMed12Primary2Text),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          if (controller.dietMap.containsKey(controller.selectedDateList[controller.selectedDietDate]))
            Expanded(
              child: Form(
                key: formKey,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.dietMap[controller.selectedDateList[controller.selectedDietDate]]!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            showAddDietSheet(controller,
                                isUpdate: true,
                                index: index,
                                dietMenuModel: controller
                                    .dietMap[controller.selectedDateList[controller.selectedDietDate]]![index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: firstIconColor,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      Center(
                                        child: DuoToneFontAwesomeIcon(
                                            iconSource: IconFont.utensilsalt,
                                            firstColor: firstIconColor,
                                            iconSize: 40,
                                            secondColor: secondIconColor,
                                            iconSecondSource: SecondIconFont.utensilsalt),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "19:00 - 19:30",
                                        style: AppTheme.notoSansMed18PrimaryText,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Öğün Başlığı",
                                        style: AppTheme.notoSansMed14PrimaryText,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        controller
                                            .dietMap[controller.selectedDateList[controller.selectedDietDate]]![index]
                                            .dietMenuTitle,
                                        style: AppTheme.notoSansMed12Primary2Text,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Öğün Detayı",
                                        style: AppTheme.notoSansMed14PrimaryText,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        controller
                                            .dietMap[controller.selectedDateList[controller.selectedDietDate]]![index]
                                            .dietMenuDetail,
                                        style: AppTheme.notoSansMed12Primary2Text,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width: pageWidht * 0.3,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              controller.copyDietMenu(index);
                                            },
                                            style: AppTheme.elevatedButtonStyle.copyWith(
                                                fixedSize: MaterialStateProperty.resolveWith((states) {
                                              if (states.contains(MaterialState.disabled)) {
                                                return const Size(5, 5);
                                              }
                                              return const Size(5, 5);
                                            })),
                                            child: const Text("Kopyala"),
                                          )),
                                      SizedBox(
                                        width: pageWidht * 0.3,
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              foregroundColor: loginGradientStartColor,
                                              fixedSize: const Size(10, 10),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),
                                              ),
                                              side: const BorderSide(
                                                width: 1.0,
                                                color: loginGradientStartColor,
                                                style: BorderStyle.solid,
                                              )),
                                          onPressed: () {
                                            controller.deleteDietMenu(index);
                                          },
                                          child: const Text("İptal Et"),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                ),
              ),
            )
          else
            Container(),
        ]);
      }),
    );
  }

  showAddDietSheet(DietController cnt, {bool isUpdate = false, DietMenuModel? dietMenuModel, int? index}) {
    final formKey = GlobalKey<FormState>();
    if (isUpdate) {
      cnt.dietMenuTitle.text = dietMenuModel!.dietMenuTitle;
      cnt.dietMenuDetail.text = dietMenuModel.dietMenuDetail;
    }

    return showDialog(
        context: NavigationService.navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return Dialog(
            child: SizedBox(
              height: pageHeight * 0.7,
              width: pageWidht,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DuoToneFontAwesomeIcon(
                                iconSource: IconFont.utensilsalt,
                                firstColor: firstIconColor,
                                iconSize: 17,
                                secondColor: secondIconColor,
                                iconSecondSource: SecondIconFont.utensilsalt),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: DuoToneFontAwesomeIcon(
                                  iconSource: IconFont.windowclose,
                                  firstColor: firstIconColor,
                                  iconSize: 24,
                                  secondColor: secondIconColor,
                                  iconSecondSource: SecondIconFont.windowclose),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            GeneralTextFormField(
                              cnt.dietMenuTitle,
                              keyboardType: TextInputType.text,
                              placeholder: isUpdate ? dietMenuModel!.dietMenuTitle : "Öğün Başlığı",
                              validator: (value) => Validations.validateIsNotEmpty(value, null),
                            ),
                            TextField(
                              controller: cnt.dietMenuDetail,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              decoration: InputDecoration(
                                  hintText: isUpdate ? dietMenuModel!.dietMenuDetail : "Öğün Detayı",
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(width: 1, color: firstIconColor))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SettingsSwitchListItem(
                        title: "Bildirim",
                        isSwitched: isUpdate ? dietMenuModel!.isNotification : true,
                        onChanged: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListWheelScrollView(
                            itemExtent: cnt.timeRangeList.length.toDouble(),
                            clipBehavior: Clip.antiAlias,
                            diameterRatio: 5,
                            children: cnt.timeRangeList),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                DuoToneFontAwesomeIcon(
                                    iconSource: IconFont.utensilsalt,
                                    firstColor: firstIconColor,
                                    iconSize: 20,
                                    secondColor: secondIconColor,
                                    iconSecondSource: SecondIconFont.utensilsalt),
                                TextButton(
                                  onPressed: () {
                                    bool valid = formKey.currentState?.validate() ?? false;
                                    if (valid) {
                                      if (isUpdate) {
                                        DietMenuModel dietMenuModel =
                                            DietMenuModel(cnt.dietMenuTitle.text, cnt.dietMenuDetail.text, true);
                                        cnt.updateDietMenu(dietMenuModel, index!);
                                        Navigator.pop(context);
                                      } else {
                                        DietMenuModel dietMenuModel =
                                            DietMenuModel(cnt.dietMenuTitle.text, cnt.dietMenuDetail.text, true);
                                        cnt.addDietMenu(dietMenuModel, cnt.selectedDietDate);
                                        Navigator.pop(context);
                                      }
                                    }
                                    //controller.addSetDietDetailWidget(controller.selectedDietDate);
                                  },
                                  style: AppTheme.textButtonStyle,
                                  child: Text(
                                    isUpdate ? "Güncelle" : "Ekle",
                                    style: AppTheme.notoSansMed18PrimaryText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
