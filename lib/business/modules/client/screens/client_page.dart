import 'package:algoritmik_diyet/business/models/client/my_clients_ouput_model.dart';
import 'package:algoritmik_diyet/business/modules/client/controller/client_controller.dart';
import 'package:algoritmik_diyet/constants/api_path.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/widgets/buttons/primary_button.dart';

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
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: GestureDetector(
                              onTap: () {
                                navigatorKey.currentState!.pushNamed(
                                    clientDetailPage,
                                    arguments: data[index]);
                              },
                              child: SizedBox(
                                height: 50,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: firstIconColor,
                                    child: Text(
                                      data[index].clientName[0] +
                                          data[index].clientName[1],
                                      style: AppTheme.notoSansSB16PrimaryText,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${DateFormat('M/d/y').format(data[index].clientStartDate)}"
                                    "     "
                                    "${data[index].firstWeight}"
                                    " - "
                                    "${data[index].lastWeight}",
                                    style: AppTheme.notoSansMed14Primary2Text,
                                  ),
                                  title: Text(
                                    data[index].clientName,
                                    style: AppTheme.notoSansMed16PrimaryText,
                                  ),
                                  trailing: PopupMenuButton<int>(
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 1,
                                        onTap: () {
                                          controller.setDeleteClient(index);
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(Icons.delete),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Sil")
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 2,
                                        child: Row(
                                          children: const [
                                            Icon(Icons.edit),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Güncelle")
                                          ],
                                        ),
                                      ),
                                    ],
                                    offset: const Offset(0, 50),
                                    color: secondBackgroundColor,
                                    elevation: 2,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
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
