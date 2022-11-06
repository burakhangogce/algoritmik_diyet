import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../utils/validations.dart';
import 'general_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField(
      {Key? key,
      this.placeHolder,
      required this.passController,
      this.validator})
      : super(key: key);

  final String? placeHolder;
  final TextEditingController passController;
  final String? Function(String?)? validator;
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool showPassword = false;

  void changePasswordVisiblity(bool show) {
    setState(() {
      showPassword = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GeneralTextFormField(
      obsecureText: !showPassword,
      widget.passController,
      suffixIcon: IconButton(
          icon: !showPassword
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
          iconSize: 21,
          color: primaryColor,
          onPressed: () => changePasswordVisiblity(!showPassword)),
      placeholder: widget.placeHolder,
      validator: widget.validator ??
          (value) => Validations.validateIsNotEmpty(value, null),
    );
  }
}
