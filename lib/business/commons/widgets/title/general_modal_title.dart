import 'package:flutter/material.dart';

import '../../../../main.dart';

class GeneralModalTitle extends StatelessWidget {
  const GeneralModalTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 17),
        width: pageWidht,
        child: const Align(
          alignment: Alignment.topCenter,
          child: Image(image: AssetImage("assets/images/Line_140.png")),
        ),
      ),
    );
  }
}
