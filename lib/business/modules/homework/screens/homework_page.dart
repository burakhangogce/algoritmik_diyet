import 'package:algoritmik_diyet/business/modules/homework/screens/homework_add_first.dart';
import 'package:algoritmik_diyet/business/modules/homework/screens/homework_add_second.dart';
import 'package:algoritmik_diyet/business/modules/homework/screens/homework_add_third.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../main.dart';
import '../../../commons/widgets/headers/main_pager_header.dart';
import '../controller/homework_controller.dart';

class HomeWorkPage extends StatefulWidget {
  const HomeWorkPage({Key? key}) : super(key: key);

  @override
  State<HomeWorkPage> createState() => _HomeWorkPageState();
}

class _HomeWorkPageState extends State<HomeWorkPage> {
  final pagerHeight = pageHeight / 5;
  final ScrollController scrollcontroller = ScrollController();
  bool scrollvisibility = true;
  String requestType = "cek";

  List<Widget> pageList = [
    const HomeWorkAddFirst(),
    HomeWorkAddSecond(),
    const HomeWorkAddThird(),
  ];
  List<String> pages = [
    "Diyet",
    "Second",
    "Third",
  ];
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

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeWorkController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: controller.pageController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: pageList,
          ),
          Consumer<HomeWorkController>(
              builder: (BuildContext context, controller, Widget? child) {
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
}
