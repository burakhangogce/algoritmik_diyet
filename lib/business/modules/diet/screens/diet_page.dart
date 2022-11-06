import 'package:algoritmik_diyet/business/modules/diet/controller/diet_controller.dart';
import 'package:algoritmik_diyet/business/modules/diet/screens/diet_add_first.dart';
import 'package:algoritmik_diyet/business/modules/diet/screens/diet_add_second.dart';
import 'package:algoritmik_diyet/business/modules/diet/screens/diet_add_third.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../main.dart';
import '../../../commons/widgets/headers/main_pager_header.dart';

class DietPage extends StatefulWidget {
  const DietPage({Key? key}) : super(key: key);

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  double index = 0;
  final ScrollController scrollcontroller = ScrollController();
  bool scrollvisibility = true;

  @override
  void initState() {
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.pixels > 50) {
        setState(() {
          scrollvisibility = false;
        });
      } else {
        setState(() {
          scrollvisibility = true;
        });
      }
    });

    super.initState();
  }

  final pagerHeight = pageHeight / 5;
  List<Widget> pageList = [
    const DietAddFirst(),
    const DietAddSecond(),
    const DietAddThird(),
  ];
  List<String> pages = [
    "Tarih",
    "Detay",
    "Tamamla",
  ];
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<DietController>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: controller.pageController,
            physics: const PageScrollPhysics(),
            children: const [
              DietAddFirst(),
              DietAddSecond(),
              DietAddThird(),
            ],
          ),
          Consumer<DietController>(builder: (BuildContext context, controller, Widget? child) {
            return Positioned(
              height: pagerHeight,
              width: pageWidht,
              child: MainPagerHeader(
                index: controller.selectedPageIndex.toDouble(),
                pages: pages,
                space: 10,
                padding: const EdgeInsets.only(left: 16, right: 16),
                onClose: () {
                  Navigator.pop(context);
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  void loginFunc() {
    Navigator.pushNamed(context, '/login');
  }
}
