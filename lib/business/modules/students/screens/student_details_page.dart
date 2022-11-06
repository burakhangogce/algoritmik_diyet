import 'package:algoritmik_diyet/business/models/students/students_output_model.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../../../../main.dart';
import '../../../commons/widgets/buttons/primary_button.dart';
import '../../../commons/widgets/textformfields/general_text_form_field.dart';

class StudentDetailsPage extends StatefulWidget {
  const StudentDetailsPage({super.key});

  @override
  State<StudentDetailsPage> createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController studentNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as StudentsOutputModel;
    fullName.text = args.studentName;
    studentNumber.text = args.studentNumber.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          args.studentName,
          style: AppTheme.notoSansSB18PrimaryText,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            const CircleAvatar(
              backgroundColor: secondIconColor,
              radius: 50,
              child: Text(
                'BG',
                style: AppTheme.notoSansMed14PrimaryText,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            GeneralTextFormField(
              fullName,
              keyboardType: TextInputType.emailAddress,
              placeholder: "Student Name",
            ),
            const SizedBox(
              height: 16,
            ),
            GeneralTextFormField(
              studentNumber,
              keyboardType: TextInputType.phone,
              placeholder: "Student Number",
            ),
            SizedBox(
              width: pageWidht * 0.9,
              child: PrimaryButton(
                onPressed: () {},
                text: "Save",
                textStyle: AppTheme.notoSansMed18White,
                style: AppTheme.elevatedButtonStyle,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
