import 'package:algoritmik_diyet/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../constants/api_path.dart';
import '../../../constants/app_color.dart';
import '../widgets/duo_tone_font_Awesome_icon.dart';
import '../widgets/main_elevated_button.dart';

class GeneralSuccessPage extends StatelessWidget {
  const GeneralSuccessPage(
      {Key? key,
      required this.firstIconSource,
      required this.secondIconSource,
      required this.title,
      required this.subTitle})
      : super(key: key);

  final String title;
  final int firstIconSource;
  final int secondIconSource;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 171),
            DuoToneFontAwesomeIcon(
              iconSource: firstIconSource,
              iconSecondSource: secondIconSource,
              firstColor: primaryColor,
              secondColor: Colors.purple,
              iconSize: 140,
            ),
            const Spacer(flex: 72),
            Text(
              title,
              style: AppTheme.notoSansSB18PrimaryText,
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 36),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 72),
            MainElevatedButton(
                text: AppLocalizations.of(context)!.create_password_header,
                onClicked: () {
                  navigatorKey.currentState!.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Container()),
                    (Route<dynamic> route) => false,
                  );
                }),
            const Spacer(flex: 171),
          ],
        ),
      ),
    );
  }
}
