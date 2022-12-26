import 'package:flutter/material.dart';

class RouteManager {
  static const bottomOffset = Offset(0.0, 1.0);
  static const rightOffset = Offset(1.0, 0.0);
  static const leftOffset = Offset(-1.0, 0.0);
  static const topOffset = Offset(0.0, -1.0);
  static const end = Offset.zero;

  static Route getMaterialRoute(
          {required Widget Function(BuildContext) builder,
          required RouteSettings settings}) =>
      MaterialPageRoute(builder: builder, settings: settings);

  static Route getModalRoute(
      {required Widget Function(BuildContext) builder,
      required RouteSettings settings}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          builder.call(context),
      settings: settings,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.ease;
        var tween = Tween(begin: bottomOffset, end: end)
            .chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route getRoute(
      {required Widget Function(BuildContext) builder,
      required RouteSettings settings}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          builder.call(context),
      settings: settings,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.ease;
        var tween =
            Tween(begin: rightOffset, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route getCustomRoute(
      {required Widget Function(BuildContext) builder,
      required RouteSettings settings,
      required Widget Function(
              BuildContext, Animation<double>, Animation<double>, Widget)
          transitionsBuilder}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          builder.call(context),
      settings: settings,
      transitionsBuilder: transitionsBuilder,
    );
  }
}
