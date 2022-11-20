import 'package:algoritmik_diyet/business/commons/widgets/badges/badge.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import '../../../../constants/app_color.dart';

class MainHeaderWithNotification extends StatelessWidget {
  const MainHeaderWithNotification({required this.badgeCount, required this.onClicked, Key? key}) : super(key: key);

  final int badgeCount;
  final Function onClicked;

  @override
  Widget build(BuildContext context) {
    var height = pageHeight / 8.0;
    return AppBar(
      toolbarHeight: height,
      leading: Container(),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: gradientBackground,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              onClicked.call();
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 50,
              width: 50,
              color: Colors.transparent,
              child: Badge(
                badgeCount: badgeCount,
                child: const Icon(
                  Icons.notifications,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
