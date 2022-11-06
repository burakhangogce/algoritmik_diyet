import 'package:flutter/material.dart';

import '../../../../../../constants/app_color.dart';
import '../../../../../../constants/app_theme.dart';
import '../../../../../../constants/localization.dart';
import '../../../../../../main.dart';
import '../../../../../commons/widgets/boxes/message_box.dart';
import '../../../../../commons/widgets/painters/curve_painter.dart';
import 'new_pass_create_password.dart';
import 'new_pass_user_info.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  PageController _pageController = PageController();
  double pageIndex = 0;
  var pagerHeight = pageHeight / 5;

  @override
  void initState() {
    _pageController = PageController()..addListener(updateState);
    super.initState();
  }

  void updateState() {
    setState(() {
      pageIndex = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(updateState);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> pages = [
      Localization.of(context)!.new_password_create_password,
      Localization.of(context)!.new_password_create_password
    ];

    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          _drawPages(),
          Positioned(
            height: pagerHeight,
            width: pageWidht,
            child: DrawTitle(
              pageIndex: pageIndex,
              context: context,
              pages: pages,
              pageController: _pageController,
            ),
          ),
          if (pageIndex < 1)
            Padding(
              padding:
                  EdgeInsets.only(top: pagerHeight - 40, right: 16, left: 16),
              child: MessageBox(
                message: Localization.of(context)!.new_password_info_box,
              ),
            )
          else
            Padding(
              padding:
                  EdgeInsets.only(top: pagerHeight - 40, right: 16, left: 16),
              child: Container(),
            ),
        ],
      ),
    );
  }

  Widget _drawPages() {
    return PageView(
      controller: _pageController,
      physics: const PageScrollPhysics(), // NeverScrollableScrollPhysics(),
      children: [
        NewPassUserInfo(
          controller: _pageController,
        ),
        const NewPassCreatePassword(),
      ],
    );
  }
}

class DrawTitle extends StatelessWidget {
  const DrawTitle({
    Key? key,
    required this.pages,
    required this.pageIndex,
    required this.context,
    required this.pageController,
  }) : super(key: key);

  final double pageIndex;
  final List<dynamic> pages;
  final BuildContext context;
  final PageController pageController;

  Widget _pagerBox(double pageNumber, double pageIndex) {
    return Container(
      height: 4,
      width: pageWidht / 2.2,
      color: pageIndex >= pageNumber ? cardColor : softBorderColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 15,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: pages
                    .asMap()
                    .map((index, str) =>
                        MapEntry(index, _pagerBox(index.toDouble(), pageIndex)))
                    .values
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (pageIndex == 1)
                  SizedBox(
                    width: 25,
                    child: IconButton(
                        onPressed: () {
                          pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 23,
                          color: backgroundColor,
                        )),
                  )
                else
                  const SizedBox(
                    height: 25,
                    width: 25,
                  ),
                Expanded(
                  child: Text(
                    '${pages[pageIndex.toInt()]} (${pageIndex.toInt() + 1}/${pages.length})',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: Colors.white, height: 1),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Image.asset('assets/images/Cikis_beyaz.png')),
              ],
            ),
            Text(
              Localization.of(context)!.create_password_header,
              textAlign: TextAlign.center,
              style: AppTheme.notoSansMed16White.copyWith(
                  height: .5,
                  color: pageIndex == 1
                      ? AppTheme.notoSansMed16White.color
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}
