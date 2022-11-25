import 'package:algoritmik_diyet/business/models/client/client_model.dart';
import 'package:algoritmik_diyet/business/models/diet/diet_day_model.dart';
import 'package:algoritmik_diyet/business/models/diet/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ClientController with ChangeNotifier {
  PageController pageController = PageController();

  DietMenuModel dietMenuModelBurakfirstfirst = DietMenuModel(
      "Kahvaltı",
      "diyet açıklaması sdfksmfksfmksfmskdfskfmksdfm",
      DateTime.now().add(const Duration(hours: -5)),
      true,
      true);
  DietMenuModel dietMenuModelBurakfirstSecond = DietMenuModel(
      "Öğlen",
      "diyet açıklaması sdfksmfksfmksfmskdfskfmksdfm",
      DateTime.now().add(const Duration(hours: 0)),
      true,
      true);
  DietMenuModel dietMenuModelBurakfirstThird = DietMenuModel(
      "Akşam",
      "diyet açıklaması sdfksmfksfmksfmskdfskfmksdfm",
      DateTime.now().add(const Duration(hours: 5)),
      true,
      false);

  DietMenuModel dietMenuModelBuraksecondfirst = DietMenuModel(
      "Kahvaltı222",
      "diyet açıklaması sdfksmfksfmksfmskd22fskfmksdfm",
      DateTime.now().add(const Duration(hours: -5)),
      true,
      true);
  DietMenuModel dietMenuModelBuraksecondSecond = DietMenuModel(
      "Öğlen222",
      "diyet a222çıklaması sdfksmfksfmksfmskdfskfmksdfm",
      DateTime.now().add(const Duration(hours: 0)),
      true,
      true);
  DietMenuModel dietMenuModelBuraksecondThird = DietMenuModel(
      "Akşam22",
      "diyet aç22ıklaması sdfksmfksfmksfmskdfskfmksdfm",
      DateTime.now().add(const Duration(hours: 5)),
      true,
      false);

  DietMenuModel dietMenuModelAysenurfirst = DietMenuModel(
      "Kahvaltı 1",
      "diyet açıklaması sdfksmfksfmksfmskdfskfmksdfm",
      DateTime.now().add(const Duration(hours: -5)),
      true,
      true);
  DietMenuModel dietMenuModelAysenurSecond = DietMenuModel(
      "Öğlen 1",
      "diyet açıklaması sdfksmfksfmksfmskdfskfmksdfm",
      DateTime.now().add(const Duration(hours: 0)),
      true,
      false);
  DietMenuModel dietMenuModelAysenurThird = DietMenuModel(
      "Akşam 1",
      "diyet açıklaması sdfksmfksfmksfmskdfskfmksdfm",
      DateTime.now().add(const Duration(hours: 5)),
      true,
      false);
  List<DietMenuModel> listDietMenuModelBurak1 = [];
  List<DietMenuModel> listDietMenuModelBurak2 = [];
  List<DietMenuModel> listDietMenuModelAysenur = [];
  List<DietMenuModel> listDietMenuModelSaliha = [];
  int selectedDietDate = 0;
  setSelectedDietDate(int value) {
    selectedDietDate = value;
    notifyListeners();
  }

  int selectedPageIndex = 0;
  String inviteCode = "";
  String copyInviteCode = "";
  List<ClientModel> listClientModel = [];

  setInviteCode() {
    var uuid = const Uuid();
    inviteCode = uuid.v1();
    notifyListeners();
  }

  setCopyInviteCode() {
    copyInviteCode = inviteCode;
  }

  List<ClientModel> createFakeDiet() {
    if (listDietMenuModelBurak1.isEmpty) {
      listDietMenuModelBurak1.add(dietMenuModelBurakfirstfirst);
      listDietMenuModelBurak1.add(dietMenuModelBurakfirstSecond);
      listDietMenuModelBurak1.add(dietMenuModelBurakfirstThird);

      listDietMenuModelBurak2.add(dietMenuModelBuraksecondfirst);
      listDietMenuModelBurak2.add(dietMenuModelBuraksecondSecond);
      listDietMenuModelBurak2.add(dietMenuModelBuraksecondThird);

      listDietMenuModelAysenur.add(dietMenuModelAysenurfirst);
      listDietMenuModelAysenur.add(dietMenuModelAysenurSecond);
      listDietMenuModelAysenur.add(dietMenuModelAysenurThird);
      DietDayModel dietDayModelBurak1 = DietDayModel(10,
          DateTime.now().add(const Duration(days: 0)), listDietMenuModelBurak1);
      DietDayModel dietDayModelBurak2 = DietDayModel(15,
          DateTime.now().add(const Duration(days: 1)), listDietMenuModelBurak2);
      DietDayModel dietDayModelAysenur = DietDayModel(
          11,
          DateTime.now().add(const Duration(days: 0)),
          listDietMenuModelAysenur);

      List<DietDayModel> listDietModelBurak = [];
      List<DietDayModel> listDietModelAysenur = [];
      List<DietDayModel> listDietModelSaliha = [];
      listDietModelBurak.add(dietDayModelBurak1);
      listDietModelBurak.add(dietDayModelBurak2);
      listDietModelAysenur.add(dietDayModelAysenur);
      DietModel dietModelBurak = DietModel(
          1,
          "burağın diyeti",
          DateTime.now().add(const Duration(days: -25)),
          DateTime.now().add(const Duration(days: 15)),
          listDietModelBurak);
      DietModel dietModelAysenur = DietModel(
          1,
          "ayşenurun diyeti",
          DateTime.now().add(const Duration(days: -10)),
          DateTime.now().add(const Duration(days: 5)),
          listDietModelAysenur);
      DietModel dietModelSaliha = DietModel(
          1,
          "salihanın diyeti",
          DateTime.now().add(const Duration(days: -5)),
          DateTime.now().add(const Duration(days: 25)),
          listDietModelSaliha);

      ClientModel clientModel1 = ClientModel(
          1,
          DateTime.now().add(const Duration(days: -600)),
          "BURAKHAN GÖGCE",
          "22",
          90,
          87,
          dietModelBurak);
      ClientModel clientModel2 = ClientModel(
          1,
          DateTime.now().add(const Duration(days: -600)),
          "AYŞENUR GÖZTÜRK",
          "22",
          90,
          87,
          dietModelAysenur);
      ClientModel clientModel3 = ClientModel(
          1,
          DateTime.now().add(const Duration(days: -600)),
          "SALİHA KANSIZ",
          "22",
          90,
          87,
          dietModelSaliha);
      listClientModel.add(clientModel1);
      listClientModel.add(clientModel2);
      listClientModel.add(clientModel3);
      return listClientModel;
    }

    return listClientModel;
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
