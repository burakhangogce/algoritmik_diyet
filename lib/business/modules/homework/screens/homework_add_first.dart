import 'package:algoritmik_diyet/business/modules/homework/controller/homework_controller.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../models/classes/classes_output_model.dart';

class HomeWorkAddFirst extends StatelessWidget {
  const HomeWorkAddFirst({super.key});

  @override
  Widget build(BuildContext context) {
    List<ClassesOutputModel> dataClasses = [];
    return Container(
      padding: EdgeInsets.only(top: pageHeight / 5, left: 16, right: 16),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Diyet Seç",
            style: AppTheme.notoSansReg24PrimaryText,
          ),
          Text("Düzenlemek istediğin diyeti seç",
              style: AppTheme.notoSansMed14White
                  .copyWith(color: primary2TextColor)),
          Consumer<HomeWorkController>(
              builder: (BuildContext context, controller, Widget? child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<dynamic>(
                    future: controller.contGetClasses(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        dataClasses = snapshot.data!;
                        return SizedBox(
                          height: pageHeight * 0.6,
                          child: ListView.builder(
                              itemCount: dataClasses.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.setSelectedIndex(
                                          dataClasses[index].classId);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: controller.selectedId ==
                                                  dataClasses[index].classId
                                              ? firstIconColor
                                              : Colors.transparent,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                      ),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: firstIconColor,
                                          child: Text(
                                            'CN',
                                            style: AppTheme
                                                .notoSansSB16PrimaryText,
                                          ),
                                        ),
                                        title:
                                            Text(dataClasses[index].className),
                                        trailing: const Icon(Icons.more_vert),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    }),
                controller.selectedId != -1
                    ? SizedBox(
                        width: pageWidht * 0.9,
                        child: PrimaryButton(
                          onPressed: () {
                            controller.onNextPage(context);
                          },
                          text: "Devam",
                          textStyle: AppTheme.notoSansMed18White,
                          style: AppTheme.elevatedButtonStyle,
                        ),
                      )
                    : Container(),
              ],
            );
          }),
        ],
      )),
    );
  }
}
