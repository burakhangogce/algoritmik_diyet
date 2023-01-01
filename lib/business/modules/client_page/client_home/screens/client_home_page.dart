import 'package:algoritmik_diyet/business/commons/utils/second_icon_font.dart';
import 'package:algoritmik_diyet/business/commons/widgets/buttons/main_button_group.dart';
import 'package:algoritmik_diyet/business/commons/widgets/duo_tone_font_awesome_icon.dart';
import 'package:algoritmik_diyet/constants/app_color.dart';
import 'package:algoritmik_diyet/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../main.dart';
import '../../../../commons/utils/icon_font.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final DateFormat format1 = DateFormat('MMMM');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DuoToneFontAwesomeIcon(
                    iconSource: IconFont.bell,
                    firstColor: firstIconColor,
                    iconSize: 24,
                    secondColor: secondIconColor,
                    iconSecondSource: SecondIconFont.bell),
              ],
            ),
            Text(
              "Hey, Burakhan Gögce 👋",
              style: AppTheme.notoSansMed14PrimaryText
                  .copyWith(fontWeight: FontWeight.w300),
            ),
            Text(
              "Diyet sürecini buradan yönetebilirsin.",
              style: AppTheme.notoSansSB18PrimaryText.copyWith(fontSize: 24),
            ),
            MainButtonGroup(
                buttons: const ["Bugün", "Yarın"],
                selectedColor: primaryColor,
                selectedTextColor: Colors.white,
                unSelectedTextColor: Colors.black,
                onchanged: ((index) => {})),
            SizedBox(
              height: 100,
              width: pageWidht * 0.9,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: softBackgroundColor,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          color: softBackgroundColor),
                      child: SizedBox(
                        width: 170,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  child: Center(
                                    child: DuoToneFontAwesomeIcon(
                                        iconSource: IconFont.utensilsalt,
                                        firstColor: firstIconColor,
                                        iconSize: 30,
                                        secondColor: secondIconColor,
                                        iconSecondSource:
                                            SecondIconFont.utensilsalt),
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
                                        "title",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:
                                            AppTheme.notoSansMed14PrimaryText,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "detail",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style:
                                            AppTheme.notoSansMed12PrimaryText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      DuoToneFontAwesomeIcon(
                                          iconSource: IconFont.firealt,
                                          firstColor: firstIconColor,
                                          iconSize: 16,
                                          secondColor: secondIconColor,
                                          iconSecondSource:
                                              SecondIconFont.firealt),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "??",
                                        style:
                                            AppTheme.notoSansMed12Primary2Text,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      DuoToneFontAwesomeIcon(
                                          iconSource: IconFont.alarmclock,
                                          firstColor: firstIconColor,
                                          iconSize: 16,
                                          secondColor: secondIconColor,
                                          iconSecondSource:
                                              SecondIconFont.alarmclock),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "19:30 - 20:00",
                                        style:
                                            AppTheme.notoSansMed12Primary2Text,
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
