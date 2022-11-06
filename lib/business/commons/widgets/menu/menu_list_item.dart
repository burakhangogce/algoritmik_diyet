import 'package:flutter/material.dart';
import '../../../../constants/app_theme.dart';

class MenuListItem extends StatelessWidget {
  const MenuListItem(
      {required this.title,
      this.backgroundColor = Colors.transparent,
      this.onClick,
      this.padding = EdgeInsets.zero,
      this.spacing = 10,
      this.preffixWidget,
      this.suffixWidget,
      Key? key})
      : super(key: key);

  final String title;

  final Function? onClick;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final double spacing;
  final Widget? preffixWidget;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleTextStyle = AppTheme.notoSansReg16PrimaryText;
    List<Widget> childrens = [];

    if (preffixWidget != null) {
      childrens.add(preffixWidget!);
      childrens.add(SizedBox(height: spacing));
    }

    childrens.add(Text(
      textAlign: TextAlign.start,
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: titleTextStyle,
    ));

    if (suffixWidget != null) {
      childrens.add(SizedBox(height: spacing));
      childrens.add(suffixWidget!);
    }

    return GestureDetector(
      onTap: () {
        onClick?.call();
      },
      child: Container(
        padding: padding,
        height: 60,
        color: backgroundColor,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: childrens),
      ),
    );
  }
}
