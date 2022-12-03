import 'dart:io';
import 'package:algoritmik_diyet/business/modules/diet/controller/diet_controller.dart';
import 'package:algoritmik_diyet/business/modules/homework/controller/homework_controller.dart';
import 'package:algoritmik_diyet/business/modules/homework/screens/homework_page.dart';
import 'package:algoritmik_diyet/business/modules/students/screens/student_details_page.dart';
import 'package:algoritmik_diyet/business/modules/students/screens/students_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobkit_flutter_servicebase/mobkit_flutter_servicebase.dart';
import 'package:provider/provider.dart';
import 'business/models/login_info.dart';
import 'business/modules/diet/screens/diet_page.dart';
import 'business/modules/login/controller/signin_controller.dart';
import 'business/modules/login/screens/secondary_signin.dart';
import 'business/modules/login/screens/signin_view.dart';
import 'business/modules/onboarding/boarding.dart';
import 'business/modules/students/controller/student_controller.dart';
import 'business/services/general/setting_service.dart';
import 'constants/app_theme.dart';
import 'core/services/navigation_service.dart';
import 'core/services/service_container.dart';

LoginInfo? loginInfo;
GetIt getIt = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

double pageHeight =
    MediaQuery.of(NavigationService.navigatorKey.currentContext!).size.height;
double pageWidht =
    MediaQuery.of(NavigationService.navigatorKey.currentContext!).size.width;

bool isTest = false;
bool isClient = false;
int nutritionistId = 1;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  MobkitServiceBase.initialize('doruk');
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
    bool boardingCompleted = getIt
            .get<SettingService>()
            .get<bool>('boardingCompleted', defaultValue: false) ??
        false;

    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme().lightTheme(),
      darkTheme: AppTheme().darkTheme(),
      routes: {
        '/': ((context) => !boardingCompleted
            ? ChangeNotifierProvider(
                create: (_) => SigninController(),
                child: const Boarding(),
              )
            : ChangeNotifierProvider(
                create: (_) => SigninController(),
                child: const SigninView(),
              )),
        "/login": (context) => ChangeNotifierProvider(
              create: (_) => SigninController(),
              child: const SigninView(),
            ),
        "/homework": (context) => ChangeNotifierProvider(
              create: (_) => HomeWorkController(),
              child: const HomeWorkPage(),
            ),
        "/secondaryLogin": (context) => ChangeNotifierProvider(
              create: (_) => SigninController(),
              child: const SecondarySignin(),
            ),
        "/students": (context) => ChangeNotifierProvider(
              create: (_) => StudentsController(),
              child: const StudentsPage(),
            ),
        "/studentdetails": (context) => ChangeNotifierProvider(
              create: (_) => StudentsController(),
              child: const StudentDetailsPage(),
            ),
        "/creatediet": (context) => ChangeNotifierProvider(
              create: (_) => DietController(),
              child: const DietPage(),
            ),
      },
    );
  }
}
