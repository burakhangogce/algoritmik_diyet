import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: primaryMaterialColor,
                primaryColorDark: primaryMaterialColor,
                accentColor: secondaryColor,
                errorColor: errorColor)
            .copyWith(secondary: secondaryColor),
        textTheme: textTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: elevatedButtonStyle.copyWith(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return overlayColor;
                }
                return null;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return disabledColor;
                }
                return null;
              },
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(style: textButtonStyle),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: outlinedButtonStyle.copyWith(
              foregroundColor: null,
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return overlayColor;
                  }
                  return null;
                },
              )),
        ));
  }

  ThemeData darkTheme() {
    return lightTheme();
  }

  static TextTheme textTheme = const TextTheme(
    headline1: TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 26.0, fontWeight: FontWeight.w600),
    headline2: TextStyle(color: primaryTextColor, fontFamily: "Sans", fontSize: 24.0),
    headline3: TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 20.0),
    headline4: TextStyle(
      color: primaryTextColor,
      fontFamily: "NotoSans",
      fontSize: 18.0,
    ),
    headline5: TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 16.0),
    headline6: TextStyle(
      color: secondaryColor,
      fontFamily: "NotoSans",
      fontSize: 16.0,
    ),
    subtitle1: TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 16.0),
    subtitle2: TextStyle(color: secondaryColor, fontFamily: "NotoSans", fontSize: 16.0),
    bodyText1: TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 16.0),
    bodyText2: TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 14.0),
    button: TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 16.0),
    caption: TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 12.0),
    overline: TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 10.0),
  );

  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: firstIconColor,
    fixedSize: const Size.fromHeight(50),
    textStyle: notoSansReg16White,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  static final ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: primaryTextColor,
    fixedSize: const Size.fromHeight(22),
  );

  static final ButtonStyle textSecondaryButtonStyle = TextButton.styleFrom(
      foregroundColor: primaryColor, textStyle: notoSansReg12Primary, fixedSize: const Size.fromHeight(12)
      // textStyle: textTheme.button?.copyWith(decoration: TextDecoration.underline),
      );

  static final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        width: 1.0,
        color: Colors.green,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
    fixedSize: const Size.fromHeight(50),
  );

  static final ButtonStyle outlineButtonBorderStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    fixedSize: const Size.fromHeight(50),
    side: const BorderSide(
      width: 1,
      color: overlayDarkColor,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
  );

  static final ButtonStyle outlineGhostButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: ghostColor,
  );

  static final ButtonStyle elevatedGhostButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: overlayColor,
    backgroundColor: ghostColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
  );

  static final ButtonStyle elevatedPrimaryPassiveButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: overlayColor,
    backgroundColor: disabledColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
  );

  static final ButtonStyle elevatedPrimaryActiveButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: overlayColor,
    backgroundColor: primaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
  );

  static final ButtonStyle elevatedPrimaryActiveBorderButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: overlayDarkColor,
    backgroundColor: primaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
  );

  static final ButtonStyle elevatedSecondaryButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: overlayColor,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      side: const BorderSide(
        color: overlayColor,
        width: 1.0,
      ));

  static final ButtonStyle elevatedEnabledButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: overlayColor,
    backgroundColor: disabledColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
  );

  static final TextStyle labelTextStyle = textTheme.bodyText2!.copyWith(
    color: primaryTextColor.withOpacity(0.61),
    fontWeight: FontWeight.w400,
  );

  static final TextStyle focusedLabelTextStyle = labelTextStyle.copyWith(fontSize: 12);

  static final ButtonStyle elevatedPrimaryActiveTextButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
  );
  static final ButtonStyle elevatedPrimaryActiveTransparentTextButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
  );

  // #region Regular

  static const TextStyle notoSansRegular = TextStyle(fontFamily: "NotoSans", fontWeight: FontWeight.w400);

  static const TextStyle notoSansReg14WhiteText = TextStyle(
      color: displayWhiteColor,
      fontFamily: "NotoSans",
      fontSize: 14.0,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400);

  static TextStyle sfProReg10White = notoSansRegular.copyWith(color: Colors.white, fontSize: 10.0);

  static TextStyle sfProReg12PrimaryText = notoSansRegular.copyWith(color: primaryTextColor, fontSize: 12.0);

  static TextStyle notoSansReg12White = notoSansRegular.copyWith(color: Colors.white, fontSize: 12.0);

  static TextStyle notoSansReg12Black = notoSansRegular.copyWith(color: Colors.black, fontSize: 12.0);

  static TextStyle notoSansReg12Inside = notoSansRegular.copyWith(color: insideFormTextColor, fontSize: 12.0);

  static TextStyle notoSansReg12Primary = notoSansRegular.copyWith(color: primaryColor, fontSize: 12.0);

  static TextStyle notoSansReg12PrimaryText = notoSansRegular.copyWith(color: primaryTextColor, fontSize: 12.0);

  static TextStyle notoSansReg13Quaternary = notoSansRegular.copyWith(color: quaternaryColor, fontSize: 13.0);

  static TextStyle notoSansReg14PrimaryText = notoSansRegular.copyWith(color: primaryTextColor, fontSize: 14.0);

  static TextStyle notoSansReg14Inside = notoSansRegular.copyWith(color: insideFormTextColor, fontSize: 14.0);

  static TextStyle notoSansReg14Quaternary = notoSansRegular.copyWith(color: quaternaryColor, fontSize: 14.0);

  static TextStyle notoSansReg16Primary = notoSansRegular.copyWith(color: primaryColor, fontSize: 16.0);

  static TextStyle notoSansReg16Inside = notoSansRegular.copyWith(color: insideFormTextColor, fontSize: 16.0);

  static TextStyle notoSansReg16PrimaryText = notoSansRegular.copyWith(color: primaryTextColor, fontSize: 16.0);

  static TextStyle notoSansReg16DarkOverlay = notoSansRegular.copyWith(color: overlayDarkColor, fontSize: 16.0);

  static TextStyle notoSansReg16Overlay = notoSansRegular.copyWith(color: overlayColor, fontSize: 16.0);

  static TextStyle notoSansReg16Quaternary =
      notoSansRegular.copyWith(color: quaternaryColor, fontSize: 16.0, height: 1.4);

  static TextStyle notoSansReg16White = notoSansRegular.copyWith(color: Colors.white, fontSize: 16.0, height: 1.4);

  static TextStyle notoSansReg16nsideFormText =
      notoSansRegular.copyWith(color: insideFormTextColor, fontSize: 16.0, height: 1.4);

  static TextStyle notoSansReg16Black = notoSansRegular.copyWith(color: Colors.black, fontSize: 16.0);

  static TextStyle notoSansReg24PrimaryText = notoSansRegular.copyWith(color: primaryTextColor, fontSize: 24.0);

  static TextStyle notoSansReg28Black = notoSansRegular.copyWith(color: Colors.black, fontSize: 28.0);

  // #endregion

  // #region Medium

  static const TextStyle notoSansMedium = TextStyle(fontFamily: "NotoSans", fontWeight: FontWeight.w500);

  static TextStyle notoSansMed16PrimaryText = notoSansMedium.copyWith(color: primaryTextColor, fontSize: 16.0);

  static TextStyle notoSansMed16White = notoSansMedium.copyWith(color: Colors.white, fontSize: 16.0, height: 1.4);

  static TextStyle notoSansMed14White =
      notoSansMedium.copyWith(color: Colors.white, fontSize: 14.0, height: 1.4, decoration: TextDecoration.none);

  static TextStyle notoSansMed18PrimaryText = notoSansMedium.copyWith(color: primaryTextColor, fontSize: 18.0);

  static TextStyle notoSansMed18White = notoSansMedium.copyWith(color: Colors.white, fontSize: 18.0);

  static const TextStyle notoSansMed12PrimaryText =
      TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 12.0, fontWeight: FontWeight.w500);

  static const TextStyle notoSansMed14PrimaryText =
      TextStyle(color: primaryTextColor, fontFamily: "NotoSans", fontSize: 14.0, fontWeight: FontWeight.w500);

  static const TextStyle notoSansMed12Primary2Text =
      TextStyle(color: primary2TextColor, fontFamily: "NotoSans", fontSize: 12.0, fontWeight: FontWeight.w500);

  static const TextStyle notoSansMed14Primary2Text =
      TextStyle(color: primary2TextColor, fontFamily: "NotoSans", fontSize: 14.0, fontWeight: FontWeight.w500);

  // #endregion

  // #region SemiBold

  static const TextStyle notoSansSemiBold = TextStyle(fontFamily: "NotoSans", fontWeight: FontWeight.w600);

  static TextStyle notoSansSB10PrimaryText = notoSansSemiBold.copyWith(color: primaryTextColor, fontSize: 10.0);
  static TextStyle notoSansSB12PrimaryText = notoSansSemiBold.copyWith(color: primaryTextColor, fontSize: 12.0);

  static TextStyle notoSansSB16PrimaryText = notoSansSemiBold.copyWith(color: primaryTextColor, fontSize: 16.0);

  static TextStyle notoSansSB18PrimaryText = notoSansSemiBold.copyWith(color: primaryTextColor, fontSize: 18.0);
  static TextStyle notoSansSB18Primary2Text = notoSansSemiBold.copyWith(color: primary2TextColor, fontSize: 18.0);
  static TextStyle notoSansSB18WhiteText = notoSansSemiBold.copyWith(color: Colors.white, fontSize: 18.0);

  static TextStyle notoSansSB35WhiteText = notoSansSemiBold.copyWith(color: Colors.white, fontSize: 35.0);

  // #endregion

  // #region BoxDecorations

  static BoxDecoration profileGeneralBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6),
    border: Border.all(color: ghostColor),
    color: Colors.white,
    boxShadow: const [
      BoxShadow(
        color: cardShadowColor,
        blurRadius: 6.0,
        spreadRadius: 0.0,
        offset: Offset(0, 3),
      ),
    ],
  );

  // #endregion

}
