import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/localization.dart';
import '../../../../main.dart';

class BoardingWidget extends StatelessWidget {
  final String image;
  const BoardingWidget(
    this.image, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(245, 161, 50, 1),
      child: SafeArea(
        bottom: false,
        child: Container(
          color: backgroundColor,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Image(
              height: pageHeight * 0.45,
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    Localization.of(context)!.boarding1_title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 22),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  child: Text(
                    Localization.of(context)!.boarding1_subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
