import 'package:algoritmik_diyet/business/commons/utils/second_icon_font.dart';
import 'package:algoritmik_diyet/business/commons/widgets/duo_tone_font_awesome_icon.dart';
import 'package:algoritmik_diyet/constants/app_color.dart';
import 'package:algoritmik_diyet/constants/app_theme.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../commons/utils/icon_font.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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

  final PageController _pageController = PageController();

  final DateFormat format1 = DateFormat('MMMM');
  var buttons = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hoşgeldin",
                      style: AppTheme.notoSansMed14PrimaryText,
                    ),
                    Text(
                      "Burakhan Gögce",
                      style: AppTheme.notoSansSB18PrimaryText,
                    ),
                  ],
                ),
                DuoToneFontAwesomeIcon(
                    iconSource: IconFont.bell,
                    firstColor: firstIconColor,
                    iconSize: 24,
                    secondColor: secondIconColor,
                    iconSecondSource: SecondIconFont.bell),
              ],
            ),
            SizedBox(
              height: 250,
              child: PageView(
                controller: _pageController,
                physics: const PageScrollPhysics(),
                children: [
                  Image.network("https://cdn.pixabay.com/photo/2022/10/16/13/53/early-morning-7525151_960_720.jpg"),
                  Image.network("https://cdn.pixabay.com/photo/2021/03/04/11/37/coast-6067736_960_720.jpg"),
                ],
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 2,
                effect: WormEffect(
                    dotColor: primaryColor.withOpacity(0.5),
                    activeDotColor: primaryColor,
                    dotHeight: 10,
                    dotWidth: 10,
                    radius: 7),
                onDotClicked: (index) => _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500), curve: Curves.bounceOut),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/creatediet');
                  },
                  child: Container(
                    height: pageHeight * 0.2,
                    width: pageWidht * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: fistBorderColor),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: fistBorderColor),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              color: background2Color),
                          child: DuoToneFontAwesomeIcon(
                              iconSource: IconFont.analytics,
                              firstColor: firstIconColor,
                              iconSize: 24,
                              secondColor: secondIconColor,
                              iconSecondSource: SecondIconFont.analytics),
                        ),
                        Center(
                            child: Text(
                          "Danışan",
                          style: AppTheme.notoSansSB16PrimaryText,
                        )),
                        const Text(
                          "Tüm danışanlarım",
                          style: AppTheme.notoSansMed14Primary2Text,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/creatediet');
                  },
                  child: Container(
                    height: pageHeight * 0.2,
                    width: pageWidht * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: fistBorderColor),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: fistBorderColor),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              color: background2Color),
                          child: DuoToneFontAwesomeIcon(
                              iconSource: IconFont.paperplane,
                              firstColor: firstIconColor,
                              iconSize: 24,
                              secondColor: secondIconColor,
                              iconSecondSource: SecondIconFont.paperplane),
                        ),
                        Center(
                            child: Text(
                          "Diyet",
                          style: AppTheme.notoSansSB16PrimaryText,
                        )),
                        const Text(
                          "Diyet Oluştur",
                          style: AppTheme.notoSansMed14Primary2Text,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: pageHeight * 0.2,
                    width: pageWidht * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: fistBorderColor),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: fistBorderColor),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              color: background2Color),
                          child: DuoToneFontAwesomeIcon(
                              iconSource: IconFont.users,
                              firstColor: firstIconColor,
                              iconSize: 24,
                              secondColor: secondIconColor,
                              iconSecondSource: SecondIconFont.users),
                        ),
                        Center(
                            child: Text(
                          "Etkileşim",
                          style: AppTheme.notoSansSB16PrimaryText,
                        )),
                        const Text(
                          "Son etkileşimler",
                          style: AppTheme.notoSansMed14Primary2Text,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: pageHeight * 0.2,
                    width: pageWidht * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: fistBorderColor),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: fistBorderColor),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              color: background2Color),
                          child: DuoToneFontAwesomeIcon(
                              iconSource: IconFont.school,
                              firstColor: firstIconColor,
                              iconSize: 24,
                              secondColor: secondIconColor,
                              iconSecondSource: SecondIconFont.school),
                        ),
                        Center(
                            child: Text(
                          "Hatırlatıcı",
                          style: AppTheme.notoSansSB16PrimaryText,
                        )),
                        const Text(
                          "Hatırlatıcılarım",
                          style: AppTheme.notoSansMed14Primary2Text,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
