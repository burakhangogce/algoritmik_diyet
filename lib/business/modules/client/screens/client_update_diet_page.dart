import 'package:algoritmik_diyet/business/models/diet/diet_model.dart';
import 'package:algoritmik_diyet/business/modules/client/controller/client_controller.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';

class UpdateDietPage extends StatelessWidget {
  const UpdateDietPage({super.key, required this.dietModel});
  final DietModel dietModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          dietModel.dietTitle,
          style: AppTheme.notoSansSB18PrimaryText,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Consumer<ClientController>(builder: (BuildContext context, controller, Widget? child) {
          return Column(children: [
            SizedBox(
              height: pageHeight / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('EEE, M/d').format(dietModel.dietStartDate),
                  style: AppTheme.notoSansSB16PrimaryText,
                ),
                Text(
                  DateFormat('EEE, M/d').format(dietModel.dietEndDate),
                  style: AppTheme.notoSansSB16PrimaryText,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              width: pageWidht * 0.9,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dietModel.dietDayModel.length,
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
                            color: controller.selectedDietDate == index ? Colors.grey.shade300 : Colors.transparent),
                        child: Column(
                          children: [
                            Text(
                              dietModel.dietDayModel[index].dietTime.day.toString(),
                              style: AppTheme.notoSansMed12PrimaryText,
                            ),
                            Text(DateFormat('EE').format(dietModel.dietDayModel[index].dietTime),
                                style: AppTheme.notoSansMed12Primary2Text),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dietModel.dietDayModel[controller.selectedDietDate].dietMenus.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    child: GestureDetector(
                      onTap: () {},
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
                                    DateFormat('hh:mm').format(dietModel
                                        .dietDayModel[controller.selectedDietDate].dietMenus[index].dietMenuTime),
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
                                    dietModel.dietDayModel[controller.selectedDietDate].dietMenus[index].dietMenuTitle,
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
                                  Flexible(
                                    child: Text(
                                      dietModel
                                          .dietDayModel[controller.selectedDietDate].dietMenus[index].dietMenuDetail,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 20,
                                      style: AppTheme.notoSansMed12Primary2Text,
                                    ),
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
                                        onPressed: () {},
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
                                      onPressed: () {},
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
                    ),
                  );
                },
              ),
            ),
          ]);
        }),
      ),
    );
  }
}
