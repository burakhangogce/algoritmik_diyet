import 'package:algoritmik_diyet/business/modules/client_page/client_home/widgets/shadow_text.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import 'package:vector_math/vector_math.dart' as Vector;

class WaterProgress extends StatefulWidget {
  const WaterProgress({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WaterProgressState();
  }
}

class _WaterProgressState extends State<WaterProgress>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  var current = 700;
  var target = 4000;

  @override
  Widget build(BuildContext context) {
    var percentage = target > 0 ? current / target * 100 : 100.0;
    var progress = (percentage > 100.0 ? 100.0 : percentage) / 100.0;
    progress = 1.0 - progress;

    return SizedBox(
      width: pageWidht * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Center(
                    child: Image.asset(
                  'assets/images/drop.png',
                  height: 90,
                  width: 90,
                )),
                Center(
                  child: AnimatedBuilder(
                    animation: CurvedAnimation(
                        parent: animationController, curve: Curves.easeInOut),
                    builder: (context, child) => ClipPath(
                      clipper: WaveClipper(
                          progress,
                          (progress > 0.0 && progress < 1.0)
                              ? animationController.value
                              : 0.0),
                      child: Image.asset(
                        'assets/images/drop-blue.png',
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      ShadowText(
                        '${(target > 0 ? current / target * 100 : 100).toStringAsFixed(0)}%',
                        shadowColor: Colors.black.withOpacity(0.5),
                        offsetX: 3.0,
                        offsetY: 3.0,
                        blur: 3.0,
                        style: TextStyle(
                            color: Colors.white.withAlpha(200),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      ShadowText(
                        '$current ml',
                        shadowColor: Colors.black.withOpacity(0.3),
                        offsetX: 3.0,
                        offsetY: 3.0,
                        blur: 3.0,
                        style: TextStyle(
                            color: Colors.white.withAlpha(150),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double progress;
  final double animation;

  WaveClipper(this.progress, this.animation);

  @override
  Path getClip(Size size) {
    final double wavesHeight = size.height * 0.1;

    var path = Path();

    if (progress == 1.0) {
      return path;
    } else if (progress == 0.0) {
      path.lineTo(0.0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0.0);
      path.lineTo(0.0, 0.0);
      return path;
    }

    List<Offset> wavePoints = [];
    for (int i = -2; i <= size.width.toInt() + 2; i++) {
      var extraHeight = wavesHeight * 0.5;
      extraHeight *= i / (size.width / 2 - size.width);
      var dx = i.toDouble();
      var dy = sin((animation * 360 - i) % 360 * Vector.degrees2Radians) * 5 +
          progress * size.height -
          extraHeight;
      if (!dx.isNaN && !dy.isNaN) {
        wavePoints.add(Offset(dx, dy));
      }
    }

    path.addPolygon(wavePoints, false);

    // finish the line
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);

    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      progress != oldClipper.progress || animation != oldClipper.animation;
}
