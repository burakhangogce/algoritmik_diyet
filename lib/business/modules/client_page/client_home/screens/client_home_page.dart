import 'package:algoritmik_diyet/business/commons/utils/second_icon_font.dart';
import 'package:algoritmik_diyet/business/commons/widgets/buttons/main_button_group.dart';
import 'package:algoritmik_diyet/business/commons/widgets/duo_tone_font_awesome_icon.dart';
import 'package:algoritmik_diyet/business/modules/client_page/client_home/widgets/water_widget.dart';
import 'package:algoritmik_diyet/constants/app_color.dart';
import 'package:algoritmik_diyet/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../main.dart';
import '../../../../commons/utils/icon_font.dart';
import '../widgets/client_home_info_widget.dart';
import '../widgets/client_home_menu_widget.dart';
import '../widgets/client_home_water_target_widget.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          shrinkWrap: true,
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
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ClientHomeMenuWidget(
                    index: index,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const ClientHomeInfoWidget(),
            const SizedBox(
              height: 16,
            ),
            const ClientHomeWaterTargetWidget()
          ],
        ),
      ),
    );
  }
}
