import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/utils/validations.dart';
import '../../../commons/widgets/textformfields/general_text_form_field.dart';
import '../../../models/diet/diet_model.dart';

class DietDetailWidget extends StatelessWidget {
  DietDetailWidget({
    Key? key,
    required this.dietTitleTxt,
    required this.dietDetailTxtList,
  }) : super(key: key);
  final TextEditingController dietTitleTxt;
  final List<TextEditingController> dietDetailTxtList;

  @override
  Widget build(BuildContext context) {
    return Consumer<DietController>(builder: (BuildContext context, controller, Widget? child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: firstIconColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              color: Colors.grey.shade100),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GeneralTextFormField(
                  dietTitleTxt,
                  keyboardType: TextInputType.text,
                  placeholder: "Öğün İsmi",
                  validator: (value) => Validations.validateIsNotEmpty(value, null),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              dietDetailTxtList.isNotEmpty
                  ? SizedBox(
                      height: 60 + (dietDetailTxtList.length * 50),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dietDetailTxtList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: GeneralTextFormField(
                              dietDetailTxtList[index],
                              keyboardType: TextInputType.text,
                              placeholder: "Öğün Detayı",
                              validator: (value) => Validations.validateIsNotEmpty(value, null),
                            ),
                          );
                        },
                      ),
                    )
                  : Container(),
              TextButton(
                onPressed: () {
                  controller.addSetDietDetailTxt(dietDetailTxtList);
                },
                style: AppTheme.textButtonStyle,
                child: const Text("Detay Ekle"),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class DietController with ChangeNotifier {
  PageController pageController = PageController();
  TextEditingController dietFirstDate = TextEditingController();
  TextEditingController dietLastDate = TextEditingController();
  TextEditingController dietMenuTitle = TextEditingController();
  TextEditingController dietMenuDetail = TextEditingController();
  int selectedPageIndex = 0;
  int selectedDietDate = 0;
  final List<Widget> timeRangeList = [
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('00:00 - 01:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('01:00 - 02:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('02:00 - 03:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('03:00 - 04:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('04:00 - 05:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('05:00 - 06:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('06:00 - 07:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('07:00 - 08:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('08:00 - 09:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('09:00 - 10:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('10:00 - 11:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('11:00 - 12:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('12:00 - 13:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('13:00 - 14:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('14:00 - 15:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('15:00 - 16:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('16:00 - 17:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('17:00 - 18:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('18:00 - 19:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('19:00 - 20:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('20:00 - 21:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('21:00 - 22:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('22:00 - 23:00')),
    Container(margin: const EdgeInsets.symmetric(vertical: 5), child: const Text('23:00 - 00:00')),
  ];
  List<Widget> textFields = [];
  List<List<TextEditingController>> diets = [];
  List<TextEditingController> controllers = [];
  List<DateTime> selectedDateList = [];
  Map<DateTime, List<DietMenuModel>> dietMap = {};
  List<DietMenuModel> copyList = [];
  DietMenuModel copyMenu = DietMenuModel("", "", true);

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

  addDietMenu(DietMenuModel dietMenuModel, int index) {
    dietMap[selectedDateList[index]]!.add(dietMenuModel);
    dietMenuTitle.clear();
    dietMenuDetail.clear();
    notifyListeners();
  }

  updateDietMenu(DietMenuModel dietMenuModel, int index) {
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

  Future displayTimePicker(
      BuildContext context, DateTime dateTime, TextEditingController textEditingController, DateTime lastDate) async {
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
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInToLinear);
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
