import 'package:algoritmik_diyet/business/models/client/my_clients_ouput_model.dart';
import 'package:algoritmik_diyet/business/models/diet/diet_model_output.dart';
import 'package:algoritmik_diyet/business/modules/client/controller/client_controller.dart';
import 'package:algoritmik_diyet/business/modules/client/screens/clien_detail_page.dart';
import 'package:algoritmik_diyet/business/modules/client/screens/client_create_page.dart';
import 'package:algoritmik_diyet/business/modules/client/screens/client_diet_menu_update.dart';
import 'package:algoritmik_diyet/business/modules/client/screens/client_page.dart';
import 'package:algoritmik_diyet/business/modules/client/screens/client_update_diet_page.dart';
import 'package:algoritmik_diyet/business/modules/dashboard/dashboard_page.dart';
import 'package:algoritmik_diyet/business/modules/diet/controller/diet_controller.dart';
import 'package:algoritmik_diyet/business/modules/diet/screens/diet_add_first.dart';
import 'package:algoritmik_diyet/business/modules/diet/screens/diet_add_second.dart';
import 'package:algoritmik_diyet/business/modules/diet/screens/diet_add_third.dart';
import 'package:algoritmik_diyet/business/modules/diet/screens/diet_page.dart';
import 'package:algoritmik_diyet/business/modules/home/controller/home_controller.dart';
import 'package:algoritmik_diyet/business/modules/home/screens/home_page.dart';
import 'package:algoritmik_diyet/business/modules/profile/screens/profile.dart';
import 'package:algoritmik_diyet/business/modules/recipe/controller/recipe_controller.dart';
import 'package:algoritmik_diyet/business/modules/recipe/screens/add_recipe.dart';
import 'package:algoritmik_diyet/constants/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../business/modules/login/controller/signin_controller.dart';
import '../business/modules/login/screens/secondary_signin.dart';
import '../business/modules/login/screens/signin_view.dart';
import '../business/modules/onboarding/boarding.dart';
import '../business/modules/recipe/screens/recipe.dart';
import '../business/services/general/setting_service.dart';
import '../main.dart';
import 'api_path.dart';

Route<dynamic>? getNavigationRoute(RouteSettings settings) {
  bool boardingCompleted = getIt
          .get<SettingService>()
          .get<bool>('boardingCompleted', defaultValue: false) ??
      false;
  switch (settings.name) {
    //region FirstPages
    case '/':
      return RouteManager.getMaterialRoute(
          settings: settings,
          builder: (context) => !boardingCompleted
              ? ChangeNotifierProvider(
                  create: (_) => SigninController(),
                  child: const Boarding(),
                )
              : ChangeNotifierProvider(
                  create: (_) => SigninController(),
                  child: const SigninView(),
                ));
    case login:
      return RouteManager.getMaterialRoute(
        settings: settings,
        builder: (context) => ChangeNotifierProvider(
          create: (_) => SigninController(),
          child: const SigninView(),
        ),
      );
    case secondaryLogin:
      return RouteManager.getMaterialRoute(
        settings: settings,
        builder: (context) => ChangeNotifierProvider(
          create: (_) => SigninController(),
          child: const SecondarySignin(),
        ),
      );
    case clientDetailPage:
      return RouteManager.getRoute(
          settings: settings,
          builder: (context) => ClientDetailPage(
                clientModel: settings.arguments as MyClientsOutputModel,
              ));
    case clientCreatePage:
      return RouteManager.getRoute(
          settings: settings, builder: (context) => const ClientCreatePage());
    case clientDietMenuUpdatePage:
      return RouteManager.getRoute(
          settings: settings,
          builder: (context) => ClientDietMenuUpdatePage(
                dietOutputMenu: settings.arguments as DietOutputMenu,
              ));
    case clientUpdateDietPage:
      return RouteManager.getRoute(
          settings: settings,
          builder: (context) => ClientUpdateDietPage(
                dietModel: settings.arguments as DietOutputModel,
              ));
    case clientPage:
      return RouteManager.getMaterialRoute(
        settings: settings,
        builder: (context) => ChangeNotifierProvider(
          create: (_) => ClientController(),
          child: const ClientPage(),
        ),
      );
    case dashboard:
      return RouteManager.getRoute(
          settings: settings, builder: (context) => const DashboardPage());
    case dietAddFirst:
      return RouteManager.getRoute(
          settings: settings, builder: (context) => const DietAddFirst());
    case dietAddSecond:
      return RouteManager.getRoute(
          settings: settings, builder: (context) => const DietAddSecond());
    case dietAddThird:
      return RouteManager.getRoute(
          settings: settings, builder: (context) => const DietAddThird());
    case dietPage:
      return RouteManager.getMaterialRoute(
        settings: settings,
        builder: (context) => ChangeNotifierProvider(
          create: (_) => DietController(),
          child: const DietPage(),
        ),
      );
    case homePage:
      return RouteManager.getMaterialRoute(
        settings: settings,
        builder: (context) => ChangeNotifierProvider(
          create: (_) => HomeController(),
          child: const HomePage(),
        ),
      );
    case boarding:
      return RouteManager.getRoute(
          settings: settings, builder: (context) => const Boarding());
    case profile:
      return RouteManager.getRoute(
          settings: settings, builder: (context) => const Profile());
    case recipe:
      return RouteManager.getMaterialRoute(
        settings: settings,
        builder: (context) => ChangeNotifierProvider(
          create: (_) => RecipeController(),
          child: const Recipe(),
        ),
      );
    case addRecipePage:
      return RouteManager.getRoute(
          settings: settings, builder: (context) => const AddRecipePage());
  }
  return null;
}
