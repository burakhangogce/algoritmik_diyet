import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_theme.dart';
import '../../../../commons/utils/icon_font.dart';
import '../../../../commons/utils/second_icon_font.dart';
import '../../../../commons/widgets/duo_tone_font_Awesome_icon.dart';

class _SalesData {
  _SalesData(this.year, this.sales, this.colors);

  final String year;
  final double sales;
  final Color colors;
}

class ClientHomeInfoWidget extends StatelessWidget {
  const ClientHomeInfoWidget({
    Key? key,
  }) : super(key: key);
  final double wantSu = 5.0;
  final double wantOgun = 3.0;
  final double wantEgzersiz = 2.0;

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData("Su", ((100.0 * 2.0) / wantSu), Colors.blue.shade400),
      _SalesData("Öğün", ((100.0 * 2.0) / wantOgun), Colors.red.shade300),
      _SalesData(
          "Egzersiz", ((100.0 * 1.0) / wantEgzersiz), Colors.brown.shade400),
    ];
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: softBackgroundColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: softBackgroundColor),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: SfCircularChart(series: <CircularSeries>[
                  RadialBarSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData data, _) => data.year,
                      yValueMapper: (_SalesData data, _) => data.sales,
                      pointColorMapper: (_SalesData data, _) => data.colors,
                      maximumValue: 100,
                      cornerStyle: CornerStyle.bothCurve)
                ]),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green.shade400,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.green.shade400),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          "Günlük Verilerin",
                          style: AppTheme.notoSansMed12PrimaryText
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "Bu kısımdan diyetinin günlük ilerleyişini izleyebilirsin.",
                      style: AppTheme.notoSansMed12PrimaryText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    DuoToneFontAwesomeIcon(
                        iconSource: IconFont.water,
                        firstColor: Colors.blue.shade400,
                        iconSize: 16,
                        secondColor: Colors.blue.shade400,
                        iconSecondSource: SecondIconFont.water),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Su"),
                  ],
                ),
                Row(
                  children: [
                    DuoToneFontAwesomeIcon(
                        iconSource: IconFont.utensilsalt,
                        firstColor: Colors.red.shade400,
                        iconSize: 16,
                        secondColor: Colors.red.shade400,
                        iconSecondSource: SecondIconFont.utensilsalt),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Öğün"),
                  ],
                ),
                Row(
                  children: [
                    DuoToneFontAwesomeIcon(
                        iconSource: IconFont.utensilsalt,
                        firstColor: Colors.brown.shade400,
                        iconSize: 16,
                        secondColor: Colors.brown.shade400,
                        iconSecondSource: SecondIconFont.utensilsalt),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("Egzersiz"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
