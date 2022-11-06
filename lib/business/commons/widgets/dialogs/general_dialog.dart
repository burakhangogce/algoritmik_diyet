import 'package:flutter/material.dart';

import '../title/general_modal_title.dart';

class GeneralDialog extends StatelessWidget {
  const GeneralDialog(
      {this.showGeneralTitle = true,
      required this.height,
      this.headerWidget,
      required this.child,
      this.fouterWidget,
      Key? key})
      : super(key: key);

  final bool showGeneralTitle;
  final double height;
  final Widget? headerWidget;
  final Widget child;
  final Widget? fouterWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showGeneralTitle
              ? const GeneralModalTitle()
              : const SizedBox(height: 20),
          headerWidget ?? Container(),
          Expanded(child: Center(child: SingleChildScrollView(child: child))),
          fouterWidget ?? Container(),
        ],
      ),
    );
  }
}
