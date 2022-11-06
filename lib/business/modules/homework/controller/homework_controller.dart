import 'dart:io';
import 'package:algoritmik_diyet/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../models/classes/classes_output_model.dart';
import '../../../models/homeworks/homework_model.dart';
import '../../../services/data/info_services.dart';

class HomeWorkController with ChangeNotifier {
  TextEditingController homeworkTitle = TextEditingController();
  TextEditingController homeworkDetails = TextEditingController();
  TextEditingController homeworkDate = TextEditingController();

  File? imageCekFrontGalery;
  File? imageCekBackGalery;
  File? imageCekFrontCamera;
  File? imageCekBackCamera;

  File? imageSenetFrontGalery;
  File? imageSenetBackGalery;
  File? imageSenetFrontCamera;
  File? imageSenetBackCamera;

  int selectedId = -1;
  bool isInitialized = false;
  int selectedPageIndex = 0;
  bool isSwitchedNotification = false;
  bool isSwitchedReminder = false;

  final InfoServices _infoServices = getIt.get<InfoServices>();
  PageController pageController = PageController();
  HomeWorkModel? newHomeWork;
  createHomeWork() {
    newHomeWork = HomeWorkModel(
        homeworkTitle.text.toString(),
        homeworkDetails.text.toString(),
        selectedId,
        isSwitchedNotification,
        isSwitchedReminder);
    return newHomeWork;
  }

  HomeWorkModel? updateHomeWork() {
    newHomeWork!.homeworkIsNotification = isSwitchedNotification;
    newHomeWork!.homeworkIsReminder = isSwitchedReminder;
    return newHomeWork;
  }

  Future<List<ClassesOutputModel>> contGetClasses() async {
    var result = await _infoServices.getClass();
    return result;
  }

  isSwitchedNotificationChange(bool lastSwitched) {
    isSwitchedNotification = lastSwitched;
    notifyListeners();
  }

  isSwitchedReminderChange(bool lastSwitched) {
    isSwitchedReminder = lastSwitched;
    notifyListeners();
  }

  Future displayTimePicker(BuildContext context, DateTime dateTime,
      TextEditingController textEditingController) async {
    var time = await showDatePicker(
      context: context,
      firstDate: DateTime.now().add(const Duration(days: -365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: dateTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: firstIconColor,
              onPrimary: secondIconColor,
              onSurface: Color(0xff050505),
            ),
          ),
          child: child!,
        );
      },
    );
    if (time != null) {
      textEditingController.text = "${time.day}/${time.month}/${time.year}";
      notifyListeners();
    }
  }

  setSelectedIndex(int index) {
    selectedId = index;
    notifyListeners();
  }

  onNextPage(BuildContext context) {
    if (pageController.page! >= 5.0) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      selectedPageIndex++;
      notifyListeners();
      pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInToLinear);
    }
  }

  onJumpPage(int index) {
    selectedPageIndex = index;
    notifyListeners();
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeInToLinear,
    );
  }
}
