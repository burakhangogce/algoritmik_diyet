import 'package:algoritmik_diyet/business/modules/client/screens/client_diet_menu_update.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../main.dart';
import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';
import '../../../models/diet/diet_model_output.dart';
import '../controller/client_controller.dart';

class DietMenuWidget extends StatelessWidget {
  const DietMenuWidget({
    Key? key,
    required this.dietModel,
    required this.dietMenuModel,
  }) : super(key: key);

  final DietOutputModel dietModel;
  final DietOutputMenu dietMenuModel;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ClientController>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: firstIconColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Center(
                      child: DuoToneFontAwesomeIcon(
                          iconSource: IconFont.utensilsalt,
                          firstColor: firstIconColor,
                          iconSize: 30,
                          secondColor: secondIconColor,
                          iconSecondSource: SecondIconFont.utensilsalt),
                    ),
                    Text(
                      DateFormat('hh:mm').format(dietMenuModel.dietMenuTime),
                      style: AppTheme.notoSansMed16PrimaryText,
                    )
                  ],
                ),
                SizedBox(
                  width: pageWidht * 0.1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dietMenuModel.dietMenuTitle,
                          style: AppTheme.notoSansMed14PrimaryText,
                        ),
                      ],
                    ),
                    Text(
                      dietMenuModel.dietMenuDetail,
                      style: AppTheme.notoSansMed14PrimaryText,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller
                            .setSelectedDietMenu(dietMenuModel.dietMenuId);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ChangeNotifierProvider(
                              create: (_) => ClientController(),
                              child: ClientDietMenuUpdate(
                                dietOutputMenu: dietMenuModel,
                              ),
                            ),
                          ),
                        );
                      },
                      style: AppTheme.textButtonStyle,
                      child: const Text(
                        "Güncelle",
                        style: AppTheme.notoSansMed14PrimaryText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: AppTheme.textButtonStyle,
                      child: Text(
                        "İptal Et",
                        style:
                            dietMenuModel.dietMenuTime.isAfter(DateTime.now())
                                ? AppTheme.notoSansMed14PrimaryText
                                : AppTheme.notoSansMed14Primary2Text,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
