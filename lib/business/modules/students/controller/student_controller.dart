import 'dart:io';
import 'package:algoritmik_diyet/business/models/students/students_output_model.dart';
import 'package:algoritmik_diyet/business/services/data/info_services.dart';
import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../../models/classes/classes_output_model.dart';

class StudentsController with ChangeNotifier {
  String? _cekNoValue;
  int? cekBankValue;
  int? cekDepartmentValue;
  int? cekKesideciLocationValue;
  int? cekDovizCinsiValue;
  int? senetDovizCinsiValue;
  int? faturaDovizCinsiValue;
  String? _cekAccountNoValue;
  bool _kesideciTCKNisValid = false;
  bool _cirantaTCKNisValid = false;
  int? editingRequestIndex;

  PageController pageController = PageController();

  TextEditingController cekNo = TextEditingController();
  TextEditingController cekBank = TextEditingController();
  TextEditingController cekSube = TextEditingController();
  TextEditingController cekHesapNo = TextEditingController();
  TextEditingController cekVade = TextEditingController();
  TextEditingController cekTutari = TextEditingController();
  TextEditingController cekDovizCinsi = TextEditingController();
  TextEditingController cekKesideciTCKN = TextEditingController();
  TextEditingController cekKesideciIsmi = TextEditingController();
  TextEditingController cekKesideciYeri = TextEditingController();
  TextEditingController cekCirantaTCKN = TextEditingController();
  TextEditingController cekCirantaIsmi = TextEditingController();

  TextEditingController senetNo = TextEditingController();
  TextEditingController senetVade = TextEditingController();
  TextEditingController senetTutari = TextEditingController();
  TextEditingController senetDovizCinsi = TextEditingController();
  TextEditingController senetBorcluTCKN = TextEditingController();
  TextEditingController senetBorcluIsmi = TextEditingController();
  TextEditingController senetSonCirantaTCKN = TextEditingController();
  TextEditingController senetSonCirantaIsmi = TextEditingController();
  TextEditingController senetKefilTCKN = TextEditingController();
  TextEditingController senetKefilIsmi = TextEditingController();

  TextEditingController faturaNo = TextEditingController();
  TextEditingController faturaTutari = TextEditingController();
  TextEditingController faturaDovizCinsi = TextEditingController();
  TextEditingController faturaTemlikTutari = TextEditingController();
  TextEditingController faturaKullanilanTutari = TextEditingController();
  TextEditingController faturaMalinCinsi = TextEditingController();
  TextEditingController faturaBorcluTCKN = TextEditingController();
  TextEditingController faturaBorcluIsmi = TextEditingController();
  TextEditingController faturaTarihi = TextEditingController();
  TextEditingController faturaVadeTarihi = TextEditingController();
  TextEditingController faturaVadeGun = TextEditingController();
  TextEditingController faturaSaticiTCKN = TextEditingController();
  TextEditingController faturaSaticiIsmi = TextEditingController();

  File? imageCekFrontGalery;
  File? imageCekBackGalery;
  File? imageCekFrontCamera;
  File? imageCekBackCamera;

  File? imageSenetFrontGalery;
  File? imageSenetBackGalery;
  File? imageSenetFrontCamera;
  File? imageSenetBackCamera;

  bool qrCodeEnable = false;
  int selectedId = -1;

  final InfoServices _infoServices = getIt.get<InfoServices>();

  Future<List<ClassesOutputModel>> contGetClasses() async {
    var result = await _infoServices.getClass();
    return result.body!;
  }

  Future<List<StudentsOutputModel>> contGetStudents() async {
    var result = await _infoServices.getStudents();
    return result.body!;
  }

  Future<List<StudentsOutputModel>> contGetStudentsClass(int id) async {
    var result = await _infoServices.getStudentsClass(id);
    return result.body!;
  }

  setSelectedIndex(int index) {
    selectedId = index;
    notifyListeners();
  }

  setQrCode(bool qrCodeEnableValue) {
    qrCodeEnable = qrCodeEnableValue;
    notifyListeners();
  }

  String? get cekNoValue => _cekNoValue;
  set cekNoValue(String? value) {
    _cekNoValue = value;
    notifyListeners();
  }

  String? get cekAccountNoValue => _cekAccountNoValue;
  set cekAccountNoValue(String? value) {
    _cekAccountNoValue = value;
    notifyListeners();
  }

  bool get kesideciTCKNisValid => _kesideciTCKNisValid;
  set kesideciTCKNisValid(bool value) {
    _kesideciTCKNisValid = value;
    notifyListeners();
  }

  bool get cirantaTCKNisValid => _cirantaTCKNisValid;
  set cirantaTCKNisValid(bool value) {
    _cirantaTCKNisValid = value;
    notifyListeners();
  }
}
