import 'package:flutter/material.dart';
import '../../../../commons/widgets/menu/menu_list_item.dart';

class ProfileListItems extends StatelessWidget {
  const ProfileListItems(
      {required this.title,
      this.backgroundColor = Colors.transparent,
      this.onClick,
      Key? key})
      : super(key: key);

  final String title;
  final Function? onClick;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MenuListItem(
      title: title,
      padding: const EdgeInsets.only(left: 15, right: 15),
      onClick: onClick,
      suffixWidget: const Icon(
        Icons.notifications,
        size: 28,
        color: Colors.black,
      ),
    );
  }
}
