import 'package:flutter/material.dart';
import '../../../../../commons/widgets/painters/curve_painter.dart';

class RenewPassword extends StatelessWidget {
  const RenewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class DrawTitle extends StatelessWidget {
  const DrawTitle({
    Key? key,
    required this.pages,
    required this.pageIndex,
    required this.context,
  }) : super(key: key);

  final double pageIndex;
  final List<dynamic> pages;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: CustomPaint(
        painter: CurvePainter(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
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
                        '${pages[pageIndex.toInt()]} (${pageIndex.toInt() + 1}/${pages.length})',
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const Image(
                      height: 25,
                      width: 25,
                      image: AssetImage("assets/images/Cikis_beyaz.png"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
