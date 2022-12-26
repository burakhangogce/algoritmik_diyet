import 'package:algoritmik_diyet/business/models/diet/diet_model_output.dart';
import 'package:algoritmik_diyet/business/modules/client/controller/client_controller.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../constants/api_path.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../widget/diet_menu_widget.dart';

class ClientUpdateDietPage extends StatelessWidget {
  const ClientUpdateDietPage({super.key, required this.dietModel});
  final DietOutputModel dietModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => navigatorKey.currentState!.pop(),
        ),
        title: Text(
          dietModel.dietTitle,
          style: AppTheme.notoSansSB18PrimaryText,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Consumer<ClientController>(
            builder: (BuildContext context, controller, Widget? child) {
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                            color: controller.selectedDietDate == index
                                ? Colors.grey.shade300
                                : dietModel.dietDayModel[index].dietTime
                                        .isBefore(DateTime.now())
                                    ? Colors.green.shade200
                                    : Colors.transparent),
                        child: Column(
                          children: [
                            Text(
                              dietModel.dietDayModel[index].dietTime.day
                                  .toString(),
                              style: AppTheme.notoSansMed12PrimaryText,
                            ),
                            Text(
                                DateFormat('EE').format(
                                    dietModel.dietDayModel[index].dietTime),
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
                itemCount: dietModel
                    .dietDayModel[controller.selectedDietDate].dietMenus.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    child: DietMenuWidget(
                      dietModel: dietModel,
                      dietMenuModel: dietModel
                          .dietDayModel[controller.selectedDietDate]
                          .dietMenus[index],
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
