import 'package:algoritmik_diyet/business/commons/widgets/boxes/message_box.dart';
import 'package:algoritmik_diyet/business/commons/widgets/textformfields/general_text_form_field.dart';
import 'package:algoritmik_diyet/constants/api_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../main.dart';
import '../../../commons/utils/icon_font.dart';
import '../../../commons/utils/second_icon_font.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../commons/widgets/duo_tone_font_Awesome_icon.dart';
import '../controller/client_controller.dart';

class ClientCreatePage extends StatelessWidget {
  const ClientCreatePage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController mailTxtCont = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => navigatorKey.currentState!.pop(),
        ),
        title: Text(
          "Danışan Oluştur",
          style: AppTheme.notoSansSB18PrimaryText,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Consumer<ClientController>(
              builder: (BuildContext context, controller, Widget? child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: pageWidht * 0.9,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: loginGradientStartColor,
                          fixedSize: const Size(10, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          side: const BorderSide(
                            width: 1.0,
                            color: loginGradientStartColor,
                            style: BorderStyle.solid,
                          )),
                      onPressed: () {
                        controller.setInviteCode();
                      },
                      child: const Text("Kod Oluştur"),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(controller.inviteCode),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DuoToneFontAwesomeIcon(
                            iconSource: IconFont.utensilsalt,
                            firstColor: firstIconColor,
                            iconSize: 17,
                            secondColor: secondIconColor,
                            iconSecondSource: SecondIconFont.utensilsalt),
                        TextButton(
                          onPressed: () {
                            controller.setCopyInviteCode();
                          },
                          style: AppTheme.textButtonStyle,
                          child: const Text(
                            "Kopyala",
                            style: AppTheme.notoSansMed14PrimaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      DuoToneFontAwesomeIcon(
                          iconSource: IconFont.mailbulk,
                          firstColor: firstIconColor,
                          iconSize: 17,
                          secondColor: secondIconColor,
                          iconSecondSource: SecondIconFont.mailbulk),
                      TextButton(
                        onPressed: () {},
                        style: AppTheme.textButtonStyle,
                        child: const Text(
                          "E-Posta",
                          style: AppTheme.notoSansMed14PrimaryText,
                        ),
                      ),
                    ],
                  ),
                  GeneralTextFormField(
                    mailTxtCont,
                    placeholder: "Danışanınızın E-Posta Adresi",
                  ),
                  const MessageBox(
                      message:
                          "Oluşturduğunuz kod 24 saat boyunca geçerli olucak"),
                  const SizedBox(
                    height: 30,
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
                ]);
          }),
        ),
      ),
    );
  }
}
