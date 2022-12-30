import 'package:algoritmik_diyet/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_theme.dart';

class MainPagerHeader extends StatelessWidget {
  const MainPagerHeader(
      {required this.index,
      required this.pages,
      this.space = 0,
      this.padding = EdgeInsets.zero,
      required this.onClose,
      Key? key})
      : super(key: key);

  final double index;
  final List<String> pages;
  final double space;
  final EdgeInsets padding;
  final Function onClose;

  @override
  Widget build(BuildContext context) {
    Widget getNameArea(BuildContext context) {
      if (index.toInt() > pages.length - 1) {
        throw Exception(
            "Index cannot be greater than the elements of the list");
      }
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 25,
            width: 25,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '${pages[index.toInt()]} (${index.toInt() + 1}/${pages.length})',
                style: AppTheme.notoSansMed18PrimaryText,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onClose.call();
            },
            child: const Icon(
              Icons.dangerous,
              color: primaryColor,
            ),
          )
        ],
      );
    }

    Widget getDesingArea() {
      if (pages.isEmpty) throw Exception("Pages list have to item");

      List<Widget> childs = [];
      for (int i = 0; i < pages.length; i++) {
        childs.add(Expanded(
          child: Container(
              height: 4, color: index >= i ? firstIconColor : Colors.white),
        ));
        if (i + 1 < pages.length) childs.add(SizedBox(width: space));
      }
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: childs,
      );
    }

    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            value: (index + 1).toDouble() / pages.length.toDouble(),
            minHeight: 8,
            semanticsLabel: 'Linear progress indicator',
          ),
          const SizedBox(height: 20),
          getNameArea(context)
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  CurvePainter({this.shader, this.outSize});

  final Shader? shader;
  final Size? outSize;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    if (outSize != null) {
      size = outSize!;
    }

    var heightMiddle = size.height - 20;
    var heightCorner = heightMiddle * 1;

    if (shader == null) {
      paint.shader = gradientBackground.createShader(Rect.fromCenter(
          center: Offset(size.width / 2, heightMiddle / 2),
          width: size.width,
          height: heightMiddle));
    } else {
      paint.shader = shader;
    }

    var path = Path();
    path.moveTo(0, heightCorner);

    path.quadraticBezierTo(
        size.width / 2, heightMiddle, size.width, heightCorner);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
