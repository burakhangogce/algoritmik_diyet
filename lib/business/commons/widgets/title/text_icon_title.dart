import 'package:flutter/material.dart';

class TextIconTitle extends StatelessWidget {
  final String title;
  final Function? action;

  const TextIconTitle({Key? key, required this.title, this.action})
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
          child: const Icon(
            Icons.cancel_sharp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
