import 'dart:io';

import 'package:algoritmik_diyet/business/commons/widgets/dialogs/loading_dialog.dart';
import 'package:algoritmik_diyet/business/models/client/client_model.dart';
import 'package:algoritmik_diyet/business/models/diet/diet_model_output.dart';
import 'package:algoritmik_diyet/business/services/data/client_services.dart';
import 'package:algoritmik_diyet/business/services/data/diet_services.dart';
import 'package:algoritmik_diyet/business/services/data/pdf_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import '../../../../main.dart';
import '../../../models/client/my_clients_ouput_model.dart';
import '../../../models/response/response_model.dart';

class ClientController with ChangeNotifier {
  PageController pageController = PageController();
  final ClientServices _clientServices = getIt.get<ClientServices>();
  final DietServices _dietServices = getIt.get<DietServices>();
  final PdfServices _pdfServices = getIt.get<PdfServices>();
  int selectedDietDate = 0;
  int selectedDietMenu = 0;
  setSelectedDietDate(int value) {
    selectedDietDate = value;
    notifyListeners();
  }

  setSelectedDietMenu(int value) {
    selectedDietMenu = value;
    notifyListeners();
  }

  TextEditingController dietMenuTitleTxt = TextEditingController();
  TextEditingController dietMenuDetailTxt = TextEditingController();
  TextEditingController dietMenuTimeTxt = TextEditingController();
  int selectedPageIndex = 0;
  String inviteCode = "";
  String copyInviteCode = "";
  List<ClientModel> listClientModel = [];
  DietOutputModel? selectedDietModel;
  String localPath = "";

  setSelectedDietModel(DietOutputModel dietOutputModel) {
    selectedDietModel = dietOutputModel;
  }

  Future<bool> checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> prepareSaveDir() async {
    localPath = (await findLocalPath())!;
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return "/sdcard/download";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Download';
    }
  }

  Future<File> storeFile(List<int> bytes, String fileName) async {
    final file = File('$localPath/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<File?> createDietPdf(int id) async {
    ResponseModel<String> pdfString = await _pdfServices.getDietPdf(id);
    LoadingDialog.openDialog();
    if (pdfString.isSuccess) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      var targetPath = appDocDir.path;
      var targetFileName = "example_pdf_file";
      var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
          pdfString.body!, targetPath, targetFileName);
      final bytes = File(generatedPdfFile.path).readAsBytesSync();
      bool permissionReady = await checkPermission();
      if (permissionReady) {
        await prepareSaveDir();
        File openFile = await storeFile(bytes, targetFileName);
        OpenFile.open(openFile.path);
      }
      return generatedPdfFile;
    }
    LoadingDialog.closeDialog();
    return null;
  }

  Future<List<MyClientsOutputModel>> myClients(int id) async {
    ResponseModel<List<MyClientsOutputModel>> myClients =
        await _clientServices.getMyClients(id);
    return myClients.body!;
  }

  Future<DietOutputModel> getMyDiet(int id) async {
    ResponseModel<DietOutputModel> myClients = await _dietServices.getDiet(id);
    return myClients.body!;
  }

  Future<DietOutputModel> updateDiet() async {
    ResponseModel<DietOutputModel> diet =
        await _dietServices.updateDiet(selectedDietModel!);
    return diet.body!;
  }

  Future<DietOutputModel> updateDietMenuLocal() async {
    DietOutputMenu editDietMenu = selectedDietModel!.dietDayModel
        .singleWhere((element) => element.dietDayId == selectedDietDate)
        .dietMenus
        .singleWhere((element) => element.dietMenuId == selectedDietMenu);
    DietOutputMenu dietOutputMenu = DietOutputMenu(
        dietDayId: selectedDietDate,
        dietMenuId: selectedDietMenu,
        dietMenuDetail: dietMenuDetailTxt.text,
        dietMenuTime: editDietMenu.dietMenuTime,
        dietMenuTitle: dietMenuTitleTxt.text,
        isCompleted: editDietMenu.isCompleted,
        isNotification: editDietMenu.isNotification);
    selectedDietModel!.dietDayModel
                .singleWhere((element) => element.dietDayId == selectedDietDate)
                .dietMenus[
            selectedDietModel!.dietDayModel
                .singleWhere((element) => element.dietDayId == selectedDietDate)
                .dietMenus
                .indexWhere(
                    (element) => element.dietMenuId == selectedDietMenu)] =
        dietOutputMenu;
    return selectedDietModel!;
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

  setDietMenuTime(TimeOfDay timeOfDay) {
    DietOutputMenu editDietMenu = selectedDietModel!.dietDayModel
        .singleWhere((element) => element.dietDayId == selectedDietDate)
        .dietMenus
        .singleWhere((element) => element.dietMenuId == selectedDietMenu);
    DateTime dietMenuTime = editDietMenu.dietMenuTime;
    dietMenuTime = DateTime(dietMenuTime.year, dietMenuTime.month,
        dietMenuTime.day, timeOfDay.hour, timeOfDay.minute);
    editDietMenu.dietMenuTime = dietMenuTime;
    selectedDietModel!.dietDayModel
                .singleWhere((element) => element.dietDayId == selectedDietDate)
                .dietMenus[
            selectedDietModel!.dietDayModel
                .singleWhere((element) => element.dietDayId == selectedDietDate)
                .dietMenus
                .indexWhere(
                    (element) => element.dietMenuId == selectedDietMenu)] =
        editDietMenu;
    dietMenuTimeTxt.text = "${timeOfDay.hour}:${timeOfDay.minute}";
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
