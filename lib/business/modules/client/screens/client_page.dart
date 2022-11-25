import 'package:algoritmik_diyet/business/modules/client/controller/client_controller.dart';
import 'package:algoritmik_diyet/business/modules/client/screens/clien_detail_page.dart';
import 'package:algoritmik_diyet/business/modules/client/screens/client_create_page.dart';
import 'package:algoritmik_diyet/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../models/client/client_model.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ClientController>(context, listen: false);
    List<ClientModel> listClientModel = controller.createFakeDiet();
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            height: pageHeight / 10,
          ),
          SizedBox(
            width: pageWidht * 0.9,
            child: PrimaryButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ChangeNotifierProvider<ClientController>.value(
                      value: controller,
                      child: const ClientCreatePage(),
                    ),
                  ),
                );
              },
              text: "Danışan Ekle",
              textStyle: AppTheme.notoSansMed18White,
              style: AppTheme.elevatedButtonStyle,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 100 +
                (listClientModel.length.toDouble() < 2
                    ? 65
                    : 80 * listClientModel.length.toDouble()),
            decoration: BoxDecoration(
                border: Border.all(
                  color: firstIconColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                color: Colors.grey.shade300),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Danışanlarım",
                        style: AppTheme.notoSansMed16PrimaryText,
                      ),
                      Text(
                        "${listClientModel.length} Adet",
                        style: AppTheme.notoSansMed16PrimaryText,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: listClientModel.length,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ChangeNotifierProvider<
                                            ClientController>.value(
                                      value: controller,
                                      child: ClientDetailPage(
                                        clientModel: listClientModel[index],
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
                                  leading: CircleAvatar(
                                    backgroundColor: firstIconColor,
                                    child: Text(
                                      listClientModel[index].clientName[0] +
                                          listClientModel[index].clientName[1],
                                      style: AppTheme.notoSansSB16PrimaryText,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${DateFormat('M/d/y').format(listClientModel[index].clientStartDate)}"
                                    "     "
                                    "${listClientModel[index].firstWeight}"
                                    " - "
                                    "${listClientModel[index].lastWeight}",
                                    style: AppTheme.notoSansMed14Primary2Text,
                                  ),
                                  title: Text(
                                    listClientModel[index].clientName,
                                    style: AppTheme.notoSansMed16PrimaryText,
                                  ),
                                  trailing: const Icon(Icons.more_vert),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
