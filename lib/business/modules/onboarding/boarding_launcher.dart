import 'package:flutter/material.dart';

import 'shared_widgets/boarding_widget.dart';

class BoardingLauncher extends StatelessWidget {
  const BoardingLauncher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BoardingWidget('assets/images/onboarding1.png');
  }
}
