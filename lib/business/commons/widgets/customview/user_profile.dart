import 'dart:io';
import 'package:flutter/material.dart';

import '../../../../constants/app_theme.dart';

class UserProfile extends StatelessWidget {
  const UserProfile(
      {required this.userName, required this.companyName, this.imageFile, this.imageUrl, this.onClickImage, Key? key})
      : super(key: key);

  final String userName;
  final String companyName;
  final File? imageFile;
  final String? imageUrl;
  final Function? onClickImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          Center(
            child: GestureDetector(
              onTap: () {
                onClickImage?.call();
              },
              child: getAvatar(),
            ),
          ),
          const SizedBox(height: 10),
          Text(userName, style: AppTheme.notoSansSB16PrimaryText, textAlign: TextAlign.center),
          Text(companyName, style: AppTheme.notoSansReg14PrimaryText, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget getAvatar() {
    CircleAvatar avatar;
    if (imageFile != null) {
      avatar = CircleAvatar(
        radius: 66,
        backgroundColor: Colors.transparent,
        backgroundImage: FileImage(imageFile!),
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      avatar = const CircleAvatar(
          radius: 66,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage("https://docs.flutter.dev/assets/images/dash/dash-fainting.gif"));
    } else {
      avatar = const CircleAvatar(
          radius: 66, backgroundImage: AssetImage("assets/images/scan.png"), backgroundColor: Colors.transparent);
    }
    return avatar;
  }
}
