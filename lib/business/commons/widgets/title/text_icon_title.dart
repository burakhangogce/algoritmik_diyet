import 'package:flutter/material.dart';

class TextIconTitle extends StatelessWidget {
  final String title;
  final String iconAsset;
  final Function? action;

  const TextIconTitle(
      {Key? key,
      required this.title,
      this.iconAsset = 'assets/images/cikis_lacivert.png',
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: action == null
              ? null
              : () {
                  action!.call();
                },
          child: Image(
            image: AssetImage(iconAsset),
            height: 25,
            width: 25,
          ),
        ),
      ],
    );
  }
}
