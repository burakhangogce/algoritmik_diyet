import 'package:algoritmik_diyet/business/modules/client/screens/client_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_color.dart';
import '../../commons/utils/icon_font.dart';
import '../../commons/utils/second_icon_font.dart';
import '../../commons/widgets/duo_tone_font_Awesome_icon.dart';
import '../client/controller/client_controller.dart';
import '../home/controller/home_controller.dart';
import '../home/screens/home_page.dart';
import '../profile/screens/profile.dart';
import '../recipe/screens/recipe.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: const HomePage(),
    ),
    ChangeNotifierProvider(
      create: (_) => ClientController(),
      child: const Client(),
    ),
    const Recipe(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _widgetOptions.elementAt(_selectedIndex),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: getBottomNavBar(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {},
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment(0.7, -0.5),
                    end: Alignment(0.6, 0.5),
                    colors: [
                      firstIconColor,
                      firstIconColor,
                    ],
                  ),
                ),
                child: const Icon(Icons.add, size: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar getBottomNavBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: firstIconColor,
        unselectedItemColor: secondIconColor,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: DuoToneFontAwesomeIcon(
                iconSource: IconFont.home,
                firstColor: _selectedIndex == 0 ? firstIconColor : secondIconColor,
                iconSize: 20,
                secondColor: _selectedIndex == 0 ? firstIconColor : secondIconColor,
                iconSecondSource: SecondIconFont.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: DuoToneFontAwesomeIcon(
                iconSource: IconFont.walking,
                firstColor: _selectedIndex == 1 ? firstIconColor : secondIconColor,
                iconSize: 20,
                secondColor: _selectedIndex == 1 ? firstIconColor : secondIconColor,
                iconSecondSource: SecondIconFont.walking),
            label: 'Danışan',
          ),
          BottomNavigationBarItem(
            icon: DuoToneFontAwesomeIcon(
                iconSource: IconFont.utensilsalt,
                firstColor: _selectedIndex == 2 ? firstIconColor : secondIconColor,
                iconSize: 20,
                secondColor: _selectedIndex == 2 ? firstIconColor : secondIconColor,
                iconSecondSource: SecondIconFont.utensilsalt),
            label: 'Tarif',
          ),
          BottomNavigationBarItem(
            icon: DuoToneFontAwesomeIcon(
                iconSource: IconFont.useredit,
                firstColor: _selectedIndex == 3 ? firstIconColor : secondIconColor,
                iconSize: 20,
                secondColor: _selectedIndex == 3 ? firstIconColor : secondIconColor,
                iconSecondSource: SecondIconFont.useredit),
            label: 'Profil',
          ),
        ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
