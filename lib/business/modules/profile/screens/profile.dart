import 'dart:io';
import 'package:algoritmik_diyet/constants/api_path.dart';
import 'package:flutter/material.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../main.dart';
import '../../../commons/widgets/buttons/approval_button_group.dart';
import '../../../commons/widgets/customview/user_profile.dart';
import '../../../commons/widgets/dialogs/general_dialog.dart';
import '../../../commons/widgets/title/text_icon_title.dart';
import '../widgets/profile_list_items.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ghostColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserProfile(
            imageFile: profileImage,
            userName: 'Burakhan  Gögce',
            companyName: 'Diyetisyen',
            onClickImage: () {},
          ),
          const SizedBox(height: 20),
          getMenu(context)
        ],
      ),
    );
  }

  Widget getMenu(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileListItems(
                title: "User Info",
                onClick: () {},
              ),
              const Divider(height: 1, color: ghostColor),
              ProfileListItems(
                title: "User Info 2",
                onClick: () {},
              ),
              const Divider(height: 1, color: ghostColor),
              ProfileListItems(
                onClick: () {},
                title: "User Info 2",
              ),
              const Divider(height: 1, color: ghostColor),
              ProfileListItems(
                title: "User Info 2",
                onClick: () {},
              ),
              const Divider(height: 1, color: ghostColor),
              ProfileListItems(
                title: "User Info 2",
                onClick: () {},
              ),
              const Divider(height: 1, color: ghostColor),
              ProfileListItems(
                title: "User Info 2",
                onClick: () {},
              ),
              const Divider(height: 1, color: ghostColor),
              ProfileListItems(
                title: "User Info 2",
                onClick: () {},
              ),
              const Divider(height: 1, color: ghostColor),
              ProfileListItems(
                title: "User Info 2",
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getLogOutDialog(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return GeneralDialog(
          showGeneralTitle: false,
          height: pageHeight * 0.3,
          headerWidget: const TextIconTitle(title: "header"),
          fouterWidget: ApprovalButtonGroup(
            rejectButtonTitle: "Reject",
            acceptButtonTitle: "Accept",
            rejectButtonPressed: () {
              Navigator.pop(context);
            },
            acceptButtonPressed: () async {
              navigatorKey.currentState!.pushNamedAndRemoveUntil(
                  login, (Route<dynamic> route) => false);
            },
          ),
          child: Text(
            "Text",
            style: AppTheme.notoSansSB18PrimaryText,
          ),
        );
      },
    );
  }
}
