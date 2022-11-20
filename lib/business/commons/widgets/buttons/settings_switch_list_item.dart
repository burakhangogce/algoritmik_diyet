import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../menu/menu_list_item.dart';

class SettingsSwitchListItem extends StatefulWidget {
  const SettingsSwitchListItem({required this.title, required this.isSwitched, required this.onChanged, Key? key})
      : super(key: key);

  final String title;
  final bool isSwitched;
  final Function onChanged;

  @override
  State<SettingsSwitchListItem> createState() => _SettingsSwitchListItemState();
}

class _SettingsSwitchListItemState extends State<SettingsSwitchListItem> {
  @override
  Widget build(BuildContext context) {
    return MenuListItem(
        title: widget.title,
        padding: const EdgeInsets.only(left: 15, right: 15),
        suffixWidget: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(widget.isSwitched ? "Açık" : "Kapalı", style: AppTheme.notoSansReg12PrimaryText),
            const SizedBox(width: 10),
            Switch(
              activeTrackColor: primaryColor,
              thumbColor: MaterialStateProperty.resolveWith((states) {
                return primaryColor;
              }),
              value: widget.isSwitched,
              onChanged: (value) {
                widget.onChanged.call(value);
              },
            ),
          ],
        ));
  }
}
