import 'package:algoritmik_diyet/business/models/client/my_clients_ouput_model.dart';
import 'package:algoritmik_diyet/business/modules/nutrition_page/client/controller/client_controller.dart';
import 'package:algoritmik_diyet/constants/api_path.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_theme.dart';
import '../../../../commons/utils/icon_font.dart';
import '../../../../commons/utils/second_icon_font.dart';
import '../../../../commons/widgets/buttons/primary_button.dart';
import '../../../../commons/widgets/duo_tone_font_Awesome_icon.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Consumer<ClientController>(
          builder: (BuildContext context, controller, Widget? child) {
        return Column(
          children: [
            SizedBox(
              height: pageHeight / 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Danışanlarım",
                  style: AppTheme.notoSansMed16PrimaryText,
                ),
                Text(
                  "3 Adet",
                  style: AppTheme.notoSansMed16PrimaryText,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<dynamic>(
                future: controller.myClients(nutritionistId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<MyClientsOutputModel> data = snapshot.data!;
                    return ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 5),
                              child: GestureDetector(
                                onTap: () {
                                  navigatorKey.currentState!.pushNamed(
                                      clientDetailPage,
                                      arguments: data[index]);
                                },
                                child: Slidable(
                                  endActionPane: const ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        flex: 2,
                                        onPressed: null,
                                        backgroundColor: secondIconColor,
                                        foregroundColor: primaryColor,
                                        icon: Icons.delete,
                                        label: 'Sil',
                                      ),
                                      SlidableAction(
                                        flex: 2,
                                        onPressed: null,
                                        backgroundColor: secondIconColor,
                                        foregroundColor: primaryColor,
                                        icon: Icons.copy,
                                        label: 'Kopyala',
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: softBackgroundColor,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15.0)),
                                        color: softBackgroundColor),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 15,
                                                      horizontal: 15),
                                                  child: Center(
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          firstIconColor,
                                                      child: Text(
                                                        data[index]
                                                                .clientName[0] +
                                                            data[index]
                                                                .clientName[1],
                                                        style: AppTheme
                                                            .notoSansSB16PrimaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        data[index].clientName,
                                                        style: AppTheme
                                                            .notoSansMed16PrimaryText,
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 20),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Başlangıç Kilosu",
                                                              style: AppTheme
                                                                  .notoSansMed14Primary2Text,
                                                            ),
                                                            Text(
                                                              data[index]
                                                                  .firstWeight
                                                                  .toString(),
                                                              style: AppTheme
                                                                  .notoSansMed14Primary2Text,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 20),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Güncel Kilo",
                                                              style: AppTheme
                                                                  .notoSansMed14Primary2Text,
                                                            ),
                                                            Text(
                                                              data[index]
                                                                  .lastWeight
                                                                  .toString(),
                                                              style: AppTheme
                                                                  .notoSansMed14Primary2Text,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                DuoToneFontAwesomeIcon(
                                                    iconSource:
                                                        IconFont.calendaredit,
                                                    firstColor: firstIconColor,
                                                    iconSize: 16,
                                                    secondColor:
                                                        secondIconColor,
                                                    iconSecondSource:
                                                        SecondIconFont
                                                            .calendaredit),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${DateTime.now().difference(data[index].clientStartDate).inDays.toString()} gündür danışanınız (${DateFormat('M/d/y').format(data[index].clientStartDate)})",
                                                  style: AppTheme
                                                      .notoSansMed12Primary2Text,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator(
                    color: primaryColor,
                  );
                }),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: pageWidht * 0.9,
              child: PrimaryButton(
                onPressed: () {
                  navigatorKey.currentState!.pushNamed(clientCreatePage);
                },
                text: "Danışan Ekle",
                textStyle: AppTheme.notoSansMed18White,
                style: AppTheme.elevatedButtonStyle,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      }),
    ));
  }
}
