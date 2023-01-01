import 'package:algoritmik_diyet/business/modules/nutrition_page/diet/controller/diet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_theme.dart';
import '../../../../../core/services/navigation_service.dart';
import '../../../../../main.dart';
import '../../../../commons/utils/icon_font.dart';
import '../../../../commons/utils/second_icon_font.dart';
import '../../../../commons/utils/validations.dart';
import '../../../../commons/widgets/duo_tone_font_Awesome_icon.dart';
import '../../../../commons/widgets/textformfields/general_text_form_field.dart';
import '../../../../models/diet/diet_model_input.dart';

class DietAddSecond extends StatelessWidget {
  const DietAddSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: pageHeight / 6),
      child: Consumer<DietController>(
          builder: (BuildContext context, controller, Widget? child) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  controller.onJumpPage(0);
                  controller.clearDiet();
                },
                child: SizedBox(
                  height: pageHeight * 0.1,
                  width: pageWidht * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: fistBorderColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: background2Color),
                        child: DuoToneFontAwesomeIcon(
                            iconSource: IconFont.calendaredit,
                            firstColor: firstIconColor,
                            iconSize: 20,
                            secondColor: secondIconColor,
                            iconSecondSource: SecondIconFont.calendaredit),
                      ),
                      const Center(
                          child: Text(
                        "Güncelle",
                        style: AppTheme.notoSansMed10PrimaryText,
                      )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.onNextPage(context);
                },
                child: SizedBox(
                  height: pageHeight * 0.1,
                  width: pageWidht * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: fistBorderColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: background2Color),
                        child: DuoToneFontAwesomeIcon(
                            iconSource: IconFont.applecrate,
                            firstColor: firstIconColor,
                            iconSize: 20,
                            secondColor: secondIconColor,
                            iconSecondSource: SecondIconFont.applecrate),
                      ),
                      const Center(
                          child: Text(
                        "Oluştur",
                        style: AppTheme.notoSansMed10PrimaryText,
                      )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showAddDietSheet(controller);
                },
                child: SizedBox(
                  height: pageHeight * 0.1,
                  width: pageWidht * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: fistBorderColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: background2Color),
                        child: DuoToneFontAwesomeIcon(
                            iconSource: IconFont.utensilsalt,
                            firstColor: firstIconColor,
                            iconSize: 20,
                            secondColor: secondIconColor,
                            iconSecondSource: SecondIconFont.utensilsalt),
                      ),
                      const Center(
                          child: Text(
                        "Ekle",
                        style: AppTheme.notoSansMed10PrimaryText,
                      )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.pasteDietMenu(controller.selectedDietDate);
                },
                child: SizedBox(
                  height: pageHeight * 0.1,
                  width: pageWidht * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: fistBorderColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: background2Color),
                        child: DuoToneFontAwesomeIcon(
                            iconSource: IconFont.paste,
                            firstColor: firstIconColor,
                            iconSize: 20,
                            secondColor: secondIconColor,
                            iconSecondSource: SecondIconFont.paste),
                      ),
                      const Center(
                          child: Text(
                        "Yapıştır",
                        style: AppTheme.notoSansMed10PrimaryText,
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 70,
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
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Text(
                            controller.selectedDateList[index].day.toString(),
                            style: AppTheme.notoSansMed18PrimaryText,
                          ),
                          Text(
                              DateFormat('EE', 'tr')
                                  .format(controller.selectedDateList[index]),
                              style: AppTheme.notoSansMed14Primary2Text),
                          const SizedBox(
                            height: 5,
                          ),
                          index == controller.selectedDietDate
                              ? Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor),
                                  width: 10,
                                  height: 10,
                                )
                              : Container(),
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
          controller.dietMap.isNotEmpty &&
                  controller.dietMap.containsKey(
                      controller.selectedDateList[controller.selectedDietDate])
              ? Expanded(
                  child: Form(
                    key: formKey,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: controller
                          .dietMap[controller
                              .selectedDateList[controller.selectedDietDate]]!
                          .length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 5),
                            child: GestureDetector(
                              onTap: () {
                                showAddDietSheet(controller,
                                    isUpdate: true,
                                    index: index,
                                    dietMenuModel: controller.dietMap[controller
                                            .selectedDateList[
                                        controller.selectedDietDate]]![index]);
                              },
                              child: Slidable(
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 2,
                                      onPressed: (context) =>
                                          controller.deleteDietMenu(index),
                                      backgroundColor: secondIconColor,
                                      foregroundColor: primaryColor,
                                      icon: Icons.delete,
                                      label: 'Sil',
                                    ),
                                    SlidableAction(
                                      flex: 2,
                                      onPressed: (context) =>
                                          controller.copyDietMenu(index),
                                      backgroundColor: secondIconColor,
                                      foregroundColor: primaryColor,
                                      icon: Icons.copy,
                                      label: 'Kopyala',
                                    ),
                                  ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: firstIconColor,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0)),
                                      color: Colors.transparent),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15,
                                                        horizontal: 15),
                                                child: Center(
                                                  child: DuoToneFontAwesomeIcon(
                                                      iconSource:
                                                          IconFont.utensilsalt,
                                                      firstColor:
                                                          firstIconColor,
                                                      iconSize: 30,
                                                      secondColor:
                                                          secondIconColor,
                                                      iconSecondSource:
                                                          SecondIconFont
                                                              .utensilsalt),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .dietMap[controller
                                                                  .selectedDateList[
                                                              controller
                                                                  .selectedDietDate]]![index]
                                                          .dietMenuTitle,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: AppTheme
                                                          .notoSansMed14PrimaryText,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      controller
                                                          .dietMap[controller
                                                                  .selectedDateList[
                                                              controller
                                                                  .selectedDietDate]]![index]
                                                          .dietMenuDetail,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: AppTheme
                                                          .notoSansMed12PrimaryText,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                children: [
                                                  DuoToneFontAwesomeIcon(
                                                      iconSource:
                                                          IconFont.firealt,
                                                      firstColor:
                                                          firstIconColor,
                                                      iconSize: 16,
                                                      secondColor:
                                                          secondIconColor,
                                                      iconSecondSource:
                                                          SecondIconFont
                                                              .firealt),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    "??",
                                                    style: AppTheme
                                                        .notoSansMed12Primary2Text,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  DuoToneFontAwesomeIcon(
                                                      iconSource:
                                                          IconFont.alarmclock,
                                                      firstColor:
                                                          firstIconColor,
                                                      iconSize: 16,
                                                      secondColor:
                                                          secondIconColor,
                                                      iconSecondSource:
                                                          SecondIconFont
                                                              .alarmclock),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    "19:30 - 20:00",
                                                    style: AppTheme
                                                        .notoSansMed12Primary2Text,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                )
              : Container(),
        ]);
      }),
    );
  }

  showAddDietSheet(DietController cnt,
      {bool isUpdate = false, DietInputMenu? dietMenuModel, int? index}) {
    final formKey = GlobalKey<FormState>();
    if (isUpdate) {
      cnt.dietMenuTitle.text = dietMenuModel!.dietMenuTitle;
      cnt.dietMenuDetail.text = dietMenuModel.dietMenuDetail;
    }
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: NavigationService.instance!.navigatorKey.currentContext!,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              color: secondaryTextColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0))),
          margin: const EdgeInsets.only(top: 35),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Expanded(
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
                                    iconSecondSource:
                                        SecondIconFont.windowclose),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              GeneralTextFormField(
                                cnt.dietMenuTitle,
                                keyboardType: TextInputType.text,
                                placeholder: isUpdate
                                    ? dietMenuModel!.dietMenuTitle
                                    : "Öğün Başlığı",
                                validator: (value) =>
                                    Validations.validateIsNotEmpty(value, null),
                              ),
                              TextField(
                                controller: cnt.dietMenuDetail,
                                keyboardType: TextInputType.multiline,
                                maxLines: 10,
                                decoration: InputDecoration(
                                    hintText: isUpdate
                                        ? dietMenuModel!.dietMenuDetail
                                        : "Öğün Detayı",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: firstIconColor))),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Saat",
                              style: AppTheme.notoSansMed18PrimaryText,
                            ),
                            cnt.dietMenuTime.text.isNotEmpty
                                ? Text(cnt.dietMenuTime.text)
                                : TextButton(
                                    onPressed: () async {
                                      final TimeOfDay? newTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: const TimeOfDay(
                                            hour: 7, minute: 15),
                                      );
                                      if (newTime != null) {
                                        cnt.dietMenuTime.text =
                                            newTime.toString();
                                      }
                                    },
                                    style: AppTheme.textButtonStyle,
                                    child: const Text(
                                      "Saat belirle",
                                      style: AppTheme.notoSansMed14Primary2Text,
                                    ),
                                  ),
                          ],
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
                                      iconSecondSource:
                                          SecondIconFont.utensilsalt),
                                  TextButton(
                                    onPressed: () {
                                      bool valid =
                                          formKey.currentState?.validate() ??
                                              false;
                                      if (valid) {
                                        if (isUpdate) {
                                          DietInputMenu dietMenuModel =
                                              DietInputMenu(
                                                  dietMenuDetail:
                                                      cnt.dietMenuDetail.text,
                                                  dietMenuTime: DateTime.now(),
                                                  dietMenuTitle:
                                                      cnt.dietMenuTitle.text,
                                                  isCompleted: true,
                                                  isNotification: false);
                                          cnt.updateDietMenu(
                                              dietMenuModel, index!);
                                          Navigator.pop(context);
                                        } else {
                                          DietInputMenu dietInputMenu =
                                              DietInputMenu(
                                                  dietMenuDetail:
                                                      cnt.dietMenuDetail.text,
                                                  dietMenuTime: DateTime.now(),
                                                  dietMenuTitle:
                                                      cnt.dietMenuTitle.text,
                                                  isCompleted: true,
                                                  isNotification: false);
                                          cnt.addDietMenu(dietInputMenu,
                                              cnt.selectedDietDate);
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
              ],
            ),
          ),
        );
      },
    );
  }
}
