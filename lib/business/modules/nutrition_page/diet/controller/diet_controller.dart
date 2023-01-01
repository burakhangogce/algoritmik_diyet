import 'package:algoritmik_diyet/business/commons/widgets/dialogs/loading_dialog.dart';
import 'package:algoritmik_diyet/business/models/client/my_clients_ouput_model.dart';
import 'package:algoritmik_diyet/business/models/diet/diet_model_input.dart';
import 'package:algoritmik_diyet/business/models/diet/diet_model_output.dart';
import 'package:algoritmik_diyet/business/models/response/response_model.dart';
import 'package:algoritmik_diyet/business/services/data/client_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../constants/app_color.dart';
import '../../../../../main.dart';
import '../../../../services/data/diet_services.dart';

class DietController with ChangeNotifier {
  PageController pageController = PageController();
  TextEditingController dietFirstDate = TextEditingController();
  TextEditingController dietClient = TextEditingController();
  TextEditingController dietLastDate = TextEditingController();
  TextEditingController dietMenuTitle = TextEditingController();
  TextEditingController dietMenuTime = TextEditingController();
  TextEditingController dietMenuDetail = TextEditingController();
  final DietServices _dietServices = getIt.get<DietServices>();
  final ClientServices _clientServices = getIt.get<ClientServices>();

  int selectedPageIndex = 0;
  int selectedDietDate = 0;

  List<Widget> textFields = [];
  List<List<TextEditingController>> diets = [];
  List<TextEditingController> controllers = [];
  List<DateTime> selectedDateList = [];
  Map<DateTime, List<DietInputMenu>> dietMap = {};
  List<DietInputMenu> copyList = [];
  DietInputMenu copyMenu = DietInputMenu(
      dietMenuTitle: "",
      dietMenuDetail: "",
      dietMenuTime: DateTime.now(),
      isCompleted: true,
      isNotification: false);
  double dietWaterLoop = 1.0;
  double dietWaterNotificationLoop = 3.0;
  double dietCoffeeLoop = 1.0;
  bool isWaterNotification = false;
  bool isMenuNotification = false;
  bool isExerciseNotification = false;
  bool isCoffeePermission = false;

  Future<ResponseModel<DietOutputModel>> createDiet() async {
    LoadingDialog.openDialog();
    List<DietInputDayModel> dietDays = [];
    for (int i = 0; i < dietMap.length; i++) {
      DietInputDayModel dietInputDayModel = DietInputDayModel(
          dietTime: dietMap.keys.elementAt(i),
          dietMenus: dietMap.values.elementAt(i));
      dietDays.add(dietInputDayModel);
    }
    DietInputModel req = DietInputModel(
        dietTitle: "dietTitle",
        dietStartDate: DateTime.now(),
        dietEndDate: DateTime.now(),
        dietDayModel: dietDays);
    ResponseModel<DietOutputModel> resp = await _dietServices.addDiet(req);
    LoadingDialog.closeDialog();
    return resp;
  }

  Future<ResponseModel<List<MyClientsOutputModel>>> getClients() async {
    LoadingDialog.openDialog();
    ResponseModel<List<MyClientsOutputModel>> resp =
        await _clientServices.getMyClients(nutritionistId);
    LoadingDialog.closeDialog();
    return resp;
  }

  setNotification(bool value, String type) {
    if (type == "water") {
      isWaterNotification = value;
    } else if (type == "menu") {
      isMenuNotification = value;
    } else if (type == "exercise") {
      isExerciseNotification = value;
    } else if (type == "coffee") {
      isCoffeePermission = value;
    }
    notifyListeners();
  }

  setDietMenuTime(TimeOfDay timeOfDay) {
    dietMenuTime.text = timeOfDay.toString();
    notifyListeners();
  }

  clearDiet() {
    dietMap.clear();
    selectedDateList.clear();
    diets.clear();
    controllers.clear();
    copyList.clear();
  }

  setDietCoffeeLoop(double value) {
    dietCoffeeLoop = value;
    notifyListeners();
  }

  setDietWaterLoop(double value) {
    dietWaterLoop = value;
    notifyListeners();
  }

  setDietWaterNotificationLoop(double value) {
    dietWaterNotificationLoop = value;
    notifyListeners();
  }

  copyDietMenu(int index) {
    copyMenu = dietMap[selectedDateList[selectedDietDate]]![index];
    notifyListeners();
  }

  pasteDietMenu(int index) {
    dietMap[selectedDateList[index]]!.add(copyMenu);
    notifyListeners();
  }

  deleteDietMenu(int index) {
    dietMap[selectedDateList[selectedDietDate]]!.removeAt(index);
    notifyListeners();
  }

  addDietMenu(DietInputMenu dietMenuModel, int index) {
    dietMap[selectedDateList[index]]!.add(dietMenuModel);
    dietMenuTitle.clear();
    dietMenuDetail.clear();
    notifyListeners();
  }

  updateDietMenu(DietInputMenu dietMenuModel, int index) {
    dietMap[selectedDateList[index]]![index] = dietMenuModel;
    dietMenuTitle.clear();
    dietMenuDetail.clear();
    notifyListeners();
  }

  copyDietDetail(int index) {
    copyList = dietMap[selectedDateList[index]]!;
  }

  pasteDietDetail(int index) {
    dietMap[selectedDateList[index]] = copyList;
    notifyListeners();
  }

  deleteDietDetail(int index) {
    dietMap[selectedDateList[selectedDietDate]]!.removeAt(index);
    notifyListeners();
  }

  addSetDietDetailTxt(List<TextEditingController> list) {
    TextEditingController controller = TextEditingController();
    list.add(controller);
    notifyListeners();
  }

  // addSetDietDetailWidget(int index) {
  //   // TextEditingController controller = TextEditingController();
  //   // List<TextEditingController> controllers = [];
  //   DietMenuModel dietMenuModel = DietMenuModel("", "", true);
  //   dietMap[selectedDateList[index]]!.add(dietMenuModel);
  //   notifyListeners();
  // }

  setSelectedDietDate(int index) {
    selectedDietDate = index;
    notifyListeners();
  }

  setSelectedDateList() {
    DateTime firstDate = DateFormat('dd-MM-yyyy').parse(dietFirstDate.text);
    DateTime lastDate = DateFormat('dd-MM-yyyy').parse(dietLastDate.text);
    for (int i = 0; i <= lastDate.difference(firstDate).inDays; i++) {
      selectedDateList.add(firstDate.add(Duration(days: i)));
      dietMap[firstDate.add(Duration(days: i))] = [];
    }
    return selectedDateList;
  }

  Future displayTimePicker(BuildContext context, DateTime dateTime,
      TextEditingController textEditingController, DateTime lastDate) async {
    var time = await showDatePicker(
      context: context,
      firstDate: dateTime,
      lastDate: lastDate,
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
      textEditingController.text = "${time.day}-${time.month}-${time.year}";
      notifyListeners();
    }
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
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInToLinear,
    );
  }
}
