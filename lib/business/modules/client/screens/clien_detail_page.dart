import 'package:algoritmik_diyet/business/models/client/my_clients_ouput_model.dart';
import 'package:algoritmik_diyet/business/models/diet/diet_day_model.dart';
import 'package:algoritmik_diyet/business/models/diet/diet_model_output.dart';
import 'package:algoritmik_diyet/business/modules/client/controller/client_controller.dart';
import 'package:algoritmik_diyet/business/modules/client/screens/client_update_diet_page.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';

class ClientDetailPage extends StatelessWidget {
  const ClientDetailPage({super.key, required this.clientModel});
  final MyClientsOutputModel clientModel;
  get primaryTextColor => null;
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ClientController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          clientModel.clientName,
          style: AppTheme.notoSansSB18PrimaryText,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: pageHeight / 50,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: firstIconColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.grey.shade300),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            clientModel.clientName,
                            style: AppTheme.notoSansMed16PrimaryText,
                          ),
                          Text(
                            clientModel.clientAge.toString(),
                            style: AppTheme.notoSansMed16PrimaryText,
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Başladığı Tarih",
                            style: AppTheme.notoSansMed16PrimaryText,
                          ),
                          Text(
                            DateFormat('M/d/y')
                                .format(clientModel.clientStartDate),
                            style: AppTheme.notoSansMed16PrimaryText,
                          ),
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Başladığı Kilo",
                            style: AppTheme.notoSansMed16PrimaryText,
                          ),
                          Text(
                            clientModel.firstWeight.toString(),
                            style: AppTheme.notoSansMed16PrimaryText,
                          ),
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Güncel Kilo",
                            style: AppTheme.notoSansMed16PrimaryText,
                          ),
                          Text(
                            clientModel.lastWeight.toString(),
                            style: AppTheme.notoSansMed16PrimaryText,
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Uyguladığı Diyet",
                style: AppTheme.notoSansMed16PrimaryText,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<dynamic>(
                future: controller.getMyDiet(clientModel.clientId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    DietOutputModel dataDiet = snapshot.data!;
                    List<DietMenu> dietMenus = [];
                    DateTime inDate = DateTime.now();
                    if (dataDiet.dietDayModel.isNotEmpty) {
                      for (int i = 0; i < dataDiet.dietDayModel.length; i++) {
                        if (dataDiet.dietDayModel[i].dietTime.day ==
                                inDate.day &&
                            dataDiet.dietDayModel[i].dietTime.month ==
                                inDate.month) {
                          dietMenus = dataDiet.dietDayModel[i].dietMenus;
                        }
                      }
                    }
                    return SizedBox(
                        height: pageHeight * 0.7,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ChangeNotifierProvider<
                                            ClientController>.value(
                                      value: controller,
                                      child: UpdateDietPage(
                                        dietModel: dataDiet,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: firstIconColor,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                ),
                                child: ListTile(
                                  subtitle: Text(
                                    "${DateFormat('M/d/y').format(dataDiet.dietStartDate)} - ${DateFormat('M/d/y').format(dataDiet.dietEndDate)}",
                                    style: AppTheme.notoSansMed14Primary2Text,
                                  ),
                                  title: Text(
                                    dataDiet.dietTitle,
                                    style: AppTheme.notoSansMed16PrimaryText,
                                  ),
                                  trailing: const Icon(Icons.more_vert),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                "Günün Menüsü",
                                style: AppTheme.notoSansMed16PrimaryText,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            dietMenus.isNotEmpty
                                ? SizedBox(
                                    height: 100 +
                                        (dietMenus.length.toDouble() < 2
                                            ? 65
                                            : 120 *
                                                dietMenus.length.toDouble()),
                                    child: ListView.builder(
                                        itemCount: dietMenus.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: firstIconColor,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                15.0)),
                                                    color: dietMenus[index]
                                                            .isCompleted
                                                        ? Colors
                                                            .blueGrey.shade100
                                                        : Colors.transparent),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        DateFormat('hh:mm')
                                                            .format(dietMenus[
                                                                    index]
                                                                .dietMenuTime),
                                                        style: AppTheme
                                                            .notoSansMed18PrimaryText,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            "Öğün Başlığı",
                                                            style: AppTheme
                                                                .notoSansMed14PrimaryText,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            dietMenus[index]
                                                                .dietMenuTitle,
                                                            style: AppTheme
                                                                .notoSansMed12Primary2Text,
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            "Öğün Detayı",
                                                            style: AppTheme
                                                                .notoSansMed14PrimaryText,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              dietMenus[index]
                                                                  .dietMenuDetail,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 20,
                                                              style: AppTheme
                                                                  .notoSansMed12Primary2Text,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Center(
                                        child: Text(
                                      "Bugün için bir öğün bulunmuyor",
                                      style: AppTheme.notoSansSB18PrimaryText,
                                    )),
                                  )
                          ],
                        ));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
