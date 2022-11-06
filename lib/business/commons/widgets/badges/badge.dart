import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';

class Badge extends StatelessWidget {
  Badge({
    Key? key,
    required this.badgeCount,
    this.badgeColor = cardColor,
    this.child,
    this.badgePositon = Alignment.topRight,
  }) : super(key: key);

  final int badgeCount;
  final Color badgeColor;
  final TextStyle badgeTextStyle = AppTheme.sfProReg10White;
  final Alignment badgePositon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(alignment: Alignment.center, child: child),
          Align(
            alignment: badgePositon,
            child: badgeCount > 0
                ? Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text('$badgeCount',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: badgeTextStyle,
                        textAlign: TextAlign.center),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
