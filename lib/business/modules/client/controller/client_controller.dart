import 'package:algoritmik_diyet/business/models/client/client_model.dart';
import 'package:algoritmik_diyet/business/models/diet/diet_model_input.dart';
import 'package:algoritmik_diyet/business/models/diet/diet_model_output.dart';
import 'package:algoritmik_diyet/business/services/data/client_services.dart';
import 'package:algoritmik_diyet/business/services/data/diet_services.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../../main.dart';
import '../../../models/client/my_clients_ouput_model.dart';
import '../../../models/response/response_model.dart';

class ClientController with ChangeNotifier {
  PageController pageController = PageController();
  final ClientServices _clientServices = getIt.get<ClientServices>();
  final DietServices _dietServices = getIt.get<DietServices>();

  int selectedDietDate = 0;
  setSelectedDietDate(int value) {
    selectedDietDate = value;
    notifyListeners();
  }

  int selectedPageIndex = 0;
  String inviteCode = "";
  String copyInviteCode = "";
  List<ClientModel> listClientModel = [];

  Future<List<MyClientsOutputModel>> myClients(int id) async {
    ResponseModel<List<MyClientsOutputModel>> myClients =
        await _clientServices.getMyClients(id);
    return myClients.body!;
  }

  Future<DietOutputModel> getMyDiet(int id) async {
    ResponseModel<DietOutputModel> myClients = await _dietServices.getDiet(id);
    return myClients.body!;
  }

  setInviteCode() {
    var uuid = const Uuid();
    inviteCode = uuid.v1();
    notifyListeners();
  }

  setDeleteClient(int index) {
    listClientModel.removeAt(index);
    notifyListeners();
  }

  setCopyInviteCode() {
    copyInviteCode = inviteCode;
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
