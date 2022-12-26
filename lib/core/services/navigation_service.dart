import 'package:flutter/material.dart';

typedef OnRouteChange<R extends Route<dynamic>> = void Function(
    R? route, R? previousRoute);

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late NavigationListener<PageRoute> navigationObserver;
  Object? _initialArgument;
  Object? get initialArgument => _initialArgument;

  NavigationService(
      {enableLogging = false,
      dynamic initialArgument,
      onPush,
      onPop,
      onRemove,
      onReplace}) {
    _initialArgument = initialArgument;
    navigationObserver = NavigationListener<PageRoute>(
        enableLogging: enableLogging,
        onPush: onPush,
        onPop: onPop,
        onRemove: onRemove,
        onReplace: onReplace);
    _instance = this;
  }

  static NavigationService? _instance;
  static NavigationService? get instance {
    if (_instance == null) {
      set(NavigationService());
    }
    return _instance;
  }

  static set(NavigationService? value) {
    _instance = value;
  }

  static NavigatorState of(BuildContext context) {
    return Navigator.of(context);
  }

  static Future<T?> push<T extends Object?>(Route<T> route) =>
      NavigationService.instance!.navigatorKey.currentState!.push<T>(route);

  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      NavigationService.instance!.navigatorKey.currentState!
          .pushNamed<T>(routeName, arguments: arguments);

  static String restorablePushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      NavigationService.instance!.navigatorKey.currentState!
          .restorablePushNamed<T>(routeName, arguments: arguments);

  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
          Route<T> newRoute,
          {TO? result}) =>
      NavigationService.instance!.navigatorKey.currentState!
          .pushReplacement<T, TO>(newRoute, result: result);

  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      NavigationService.instance!.navigatorKey.currentState!
          .pushReplacementNamed<T, TO>(routeName,
              result: result, arguments: arguments);

  static Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      NavigationService.instance!.navigatorKey.currentState!
          .popAndPushNamed<T, TO>(routeName,
              result: result, arguments: arguments);

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) =>
      NavigationService.instance!.navigatorKey.currentState!
          .pushNamedAndRemoveUntil<T>(newRouteName, predicate,
              arguments: arguments);

  static void replace<T extends Object?>(
          {required Route<dynamic> oldRoute, required Route<T> newRoute}) =>
      NavigationService.instance!.navigatorKey.currentState!
          .replace<T>(oldRoute: oldRoute, newRoute: newRoute);

  static Future<T?> pushAndRemoveUntil<T extends Object?>(
          Route<T> newRoute, RoutePredicate predicate) =>
      NavigationService.instance!.navigatorKey.currentState!
          .pushAndRemoveUntil(newRoute, predicate);
  static String restorablePushAndRemoveUntil<T extends Object?>(
          RestorableRouteBuilder<T> newRouteBuilder, RoutePredicate predicate,
          {Object? arguments}) =>
      NavigationService.instance!.navigatorKey.currentState!
          .restorablePushAndRemoveUntil(newRouteBuilder, predicate);

  static void popUntil(RoutePredicate predicate) =>
      NavigationService.instance!.navigatorKey.currentState!
          .popUntil(predicate);
}

class NavigationListener<R extends Route<dynamic>> extends RouteObserver<R> {
  final bool enableLogging;

  Route? currentRoute;
  Route? oldRoute;
  final List<Route<dynamic>> _stack = [];

  final OnRouteChange? onPush;
  final OnRouteChange? onPop;
  final OnRouteChange? onReplace;
  final OnRouteChange? onRemove;

  NavigationListener(
      {this.enableLogging = false,
      this.onPush,
      this.onPop,
      this.onRemove,
      this.onReplace});

  @override
  void didPop(Route route, Route? previousRoute) {
    onPop?.call(route, previousRoute);
    super.didPop(route, previousRoute);
    currentRoute = route;
    oldRoute = previousRoute;
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _stack.add(route);
    onPush?.call(route, previousRoute);

    super.didPush(route, previousRoute);
    currentRoute = route;
    oldRoute = previousRoute;
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _stack.remove(route);
    onRemove?.call(route, previousRoute);
    super.didRemove(route, previousRoute);
    currentRoute = route;
    oldRoute = previousRoute;
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (oldRoute != null && _stack.contains(oldRoute)) {
      final oldItemIndex = _stack.indexOf(oldRoute);
      if (newRoute != null) {
        _stack[oldItemIndex] = newRoute;
      } else {
        _stack.removeAt(oldItemIndex);
      }
    }
    onReplace?.call(newRoute, oldRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    currentRoute = newRoute;
    oldRoute = oldRoute;
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }

  @override
  void subscribe(RouteAware routeAware, R route) {
    super.subscribe(routeAware, route);
  }

  @override
  void unsubscribe(RouteAware routeAware) {
    super.unsubscribe(routeAware);
  }
}
