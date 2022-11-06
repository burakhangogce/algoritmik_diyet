import 'package:algoritmik_diyet/business/commons/widgets/buttons/primary_button.dart';
import 'package:algoritmik_diyet/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../constants/app_color.dart';
import '../../../main.dart';
import '../../services/general/setting_service.dart';
import 'boarding_finished.dart';
import 'boarding_first.dart';
import 'boarding_launcher.dart';
import 'boarding_second.dart';

class Boarding extends StatefulWidget {
  const Boarding({Key? key}) : super(key: key);

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  PageController _pageController = PageController();
  double index = 0;
  @override
  void initState() {
    _pageController = PageController()..addListener(updateState);
    super.initState();
  }

  void updateState() {
    setState(() {
      index = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(updateState);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: _pageController,
            physics: const PageScrollPhysics(),
            children: const [
              BoardingLauncher(),
              BoardingFirst(),
              BoardingSecond(),
              BoardingFinished(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 4,
                        effect: WormEffect(
                            dotColor: primaryColor.withOpacity(0.5),
                            activeDotColor: primaryColor,
                            dotHeight: 10,
                            dotWidth: 10,
                            radius: 7),
                        onDotClicked: (index) => _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.bounceOut),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: pageHeight * 0.05,
                ),
                SizedBox(
                  width: pageWidht * 0.8,
                  child: PrimaryButton(
                    onPressed: loginFunc,
                    text: "Sign Up",
                    textStyle: AppTheme.notoSansMed18White,
                    style: AppTheme.elevatedButtonStyle,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: pageWidht * 0.8,
                  child: PrimaryButton(
                    onPressed: loginFunc,
                    text: "Login",
                    textStyle: AppTheme.notoSansMed18White,
                    style: AppTheme.elevatedButtonStyle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void loginFunc() {
    Navigator.pushNamed(context, '/login');
  }

  Widget getWizardButton() {
    return ElevatedButton(
      onPressed: () {
        if (_pageController.page! >= 3.0) {
          getIt.get<SettingService>().setAsync<bool>('boardingCompleted', true);
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInToLinear);
        }
      },
      key: const Key('smooth-page-indicator'),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(35, 35)),
        backgroundColor: MaterialStateProperty.all(primaryTextColor),
        shape: MaterialStateProperty.all<CircleBorder>(
            const CircleBorder(side: BorderSide.none)),
      ),
      child: Icon(
        size: const Size(10, 10).height,
        Icons.arrow_forward,
        color: backgroundColor,
      ),
    );
  }
}
