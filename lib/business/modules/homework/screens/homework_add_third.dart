import 'package:algoritmik_diyet/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_theme.dart';
import '../../../../main.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../commons/widgets/buttons/settings_switch_list_item.dart';
import '../controller/homework_controller.dart';

class HomeWorkAddThird extends StatelessWidget {
  const HomeWorkAddThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: pageHeight / 5, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Consumer<HomeWorkController>(
            builder: (BuildContext context, controller, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                "Ödevi Gönder",
                style: AppTheme.notoSansReg24PrimaryText,
              ),
              Text("Ödevi tamamlamadan önce bilgileri kontrol ediniz.",
                  style: AppTheme.notoSansMed14White
                      .copyWith(color: primary2TextColor)),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Sınıf",
                style: AppTheme.notoSansSB18Primary2Text,
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  controller.onJumpPage(0);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: firstIconColor),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: firstIconColor,
                      child: Text(
                        'CN',
                        style: AppTheme.notoSansSB16PrimaryText,
                      ),
                    ),
                    title: const Text("sınıf ismi"),
                    trailing: Text(
                      "Değiştir",
                      style: AppTheme.notoSansSB12PrimaryText,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Detaylar",
                style: AppTheme.notoSansSB18Primary2Text,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: firstIconColor),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ödev Başlığı",
                              style: AppTheme.notoSansMed16PrimaryText,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              controller.homeworkTitle.text,
                              style: AppTheme.notoSansMed14Primary2Text,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Ödev Detayı",
                              style: AppTheme.notoSansMed16PrimaryText,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              controller.homeworkDetails.text,
                              style: AppTheme.notoSansMed14Primary2Text,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: pageWidht * 0.9,
                        child: TextButton(
                          onPressed: () {
                            controller.onJumpPage(1);
                          },
                          style: AppTheme.textButtonStyle,
                          child: const Text("Güncelle"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Ödev Ayarları",
                style: AppTheme.notoSansSB18Primary2Text,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: firstIconColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Column(
                  children: [
                    SettingsSwitchListItem(
                      title: "ayar",
                      isSwitched: controller.isSwitchedNotification,
                      onChanged: () {
                        controller.isSwitchedNotificationChange(
                            !controller.isSwitchedNotification);
                      },
                    ),
                    SettingsSwitchListItem(
                      title: "ayar",
                      isSwitched: controller.isSwitchedReminder,
                      onChanged: () {
                        controller.isSwitchedReminderChange(
                            !controller.isSwitchedReminder);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: pageWidht * 0.9,
                child: PrimaryButton(
                  onPressed: () {},
                  text: "Tamamla",
                  textStyle: AppTheme.notoSansMed18White,
                  style: AppTheme.elevatedButtonStyle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        }),
      ),
    );
  }
}
