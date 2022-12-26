import 'package:algoritmik_diyet/core/services/navigation_service.dart';
import 'package:flutter/material.dart';

const String identifier = 'mvc';
const String secret = 'secret';
final List<String> responseTypes = ['id_token', 'token'];
final List<String> scopes = ['openid', 'profile', 'api1', 'offline_access'];
final GlobalKey<NavigatorState> navigatorKey =
    NavigationService.instance!.navigatorKey;
const login = "/login";
const secondaryLogin = "/secondarylogin";
const newPassword = "/newPassword";
const clientDetailPage = "/clientDetailPage";
const clientCreatePage = "/clientCreatePage";
const clientDietMenuUpdatePage = "/clientDietMenuUpdatePage";
const clientPage = "/clientPage";
const clientUpdateDietPage = "/clientUpdateDietPage";
const dashboard = "/dashboard";
const dietAddFirst = "/dietAddFirst";
const dietAddSecond = "/dietAddSecond";
const dietAddThird = "/dietAddThird";
const dietPage = "/dietPage";
const homePage = "/homePage";
const boarding = "/boarding";
const profile = "/profile";
const addRecipePage = "/addRecipePage";
const recipe = "/recipe";
