import 'package:algoritmik_diyet/business/modules/client_page/client_home/widgets/water_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_theme.dart';

class ClientHomeWaterTargetWidget extends StatelessWidget {
  const ClientHomeWaterTargetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: softBackgroundColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: softBackgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const WaterProgress(),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Güncel",
                        style: AppTheme.notoSansMed16PrimaryText,
                      ),
                      Row(
                        children: [
                          const Text(
                            "700",
                            style: AppTheme.notoSansMed12PrimaryText,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "ml",
                            style: AppTheme.notoSansMed10PrimaryText
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "Hedef",
                        style: AppTheme.notoSansMed16PrimaryText,
                      ),
                      Row(
                        children: [
                          const Text(
                            "4000",
                            style: AppTheme.notoSansMed12PrimaryText,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "ml",
                            style: AppTheme.notoSansMed10PrimaryText
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/add_drink.png',
                width: 40.0,
                height: 40.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
