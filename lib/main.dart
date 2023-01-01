import 'dart:io';
import 'package:algoritmik_diyet/constants/navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobkit_flutter_servicebase/mobkit_flutter_servicebase.dart';
import 'business/models/login_info.dart';
import 'constants/app_theme.dart';
import 'core/services/navigation_service.dart';
import 'core/services/service_container.dart';

LoginInfo? loginInfo;
GetIt getIt = GetIt.instance;

double pageHeight =
    MediaQuery.of(NavigationService.instance!.navigatorKey.currentContext!)
        .size
        .height;
double pageWidht =
    MediaQuery.of(NavigationService.instance!.navigatorKey.currentContext!)
        .size
        .width;

bool isTest = false;
bool isClient = true;
int nutritionistId = 1;
int clientId = 1;
TargetPlatform platform =
    Platform.isAndroid ? TargetPlatform.android : TargetPlatform.iOS;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  MobkitServiceBase.initialize('doruk');
  NavigationService(enableLogging: true);
  await Firebase.initializeApp();
  await ServiceContainer.registerService();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.instance!.navigatorKey,
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme().lightTheme(),
      darkTheme: AppTheme().darkTheme(),
      initialRoute: "/",
      onGenerateRoute: getNavigationRoute,
    );
  }
}
