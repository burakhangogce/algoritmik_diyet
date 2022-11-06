import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';
import '../dots/required_dot.dart';

class GeneralTextFormField extends StatefulWidget {
  const GeneralTextFormField(this.controller,
      {this.placeholder,
      this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.obsecureText = false,
      this.inputFormatters,
      this.focused,
      this.unFocused,
      this.isEnabled,
      this.isRequired = false,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final String? placeholder;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final IconButton? suffixIcon;
  final bool obsecureText;
  final List<TextInputFormatter>? inputFormatters;
  final Function? focused;
  final Function? unFocused;
  final bool? isEnabled;
  final bool isRequired;

  @override
  State<StatefulWidget> createState() => _GeneralTextFormFieldState();
}

class _GeneralTextFormFieldState extends State<GeneralTextFormField> {
  FocusNode myFocusNode = FocusNode();
  Color boxColor = softBorderColor;
  bool isError = false;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    if (widget.focused != null || widget.unFocused != null) {
      myFocusNode.addListener(myFocusNodeListener);
    }
  }

  void updateFocus() {
    if (!myFocusNode.hasFocus) {
      updateColor();
    }
  }

  void updateColor() {
    if (widget.validator != null) {
      var errorText = widget.validator!(widget.controller.text);
      isError = errorText != null;
      if (isError) {
        boxColor = errorColor;
      }
    }
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deco = getDecoration();

    if (widget.isEnabled == null) {
      if (!deco.enabled) {
        boxColor = isError ? errorColor : softBorderColor;
      } else if (myFocusNode.hasFocus) {
        boxColor = isError ? errorColor : primaryColor;
      } else {
        boxColor = isError ? errorColor : softBorderColor;
      }
    } else if (widget.isEnabled!) {
      boxColor = isError ? errorColor : softBorderColor;
    }

    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: boxColor), borderRadius: const BorderRadius.all(Radius.circular(7))),
          child: widget.isRequired
              ? const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Align(alignment: Alignment.centerRight, child: RequiredDot()),
                )
              : null,
        ),
        SizedBox(
          height: 63,
          child: Padding(
            padding: EdgeInsets.only(top: 4.0, right: widget.isRequired ? 26.0 : 6.0),
            child: TextFormField(
              readOnly: widget.isEnabled != null && !widget.isEnabled! ? true : false,
              inputFormatters: widget.inputFormatters,
              obscureText: widget.obsecureText,
              focusNode: myFocusNode,
              style: widget.isEnabled != null && !widget.isEnabled!
                  ? AppTheme.notoSansReg16Inside
                  : AppTheme.notoSansReg16Quaternary,
              validator: (val) {
                String? errorText = widget.validator!(val);
                Future.microtask(() {
                  updateColor();
                });
                return errorText;
              },
              autovalidateMode: widget.validator != null ? AutovalidateMode.onUserInteraction : null,
              keyboardType: widget.keyboardType,
              onChanged: (value) {},
              controller: widget.controller,
              decoration: deco,
            ),
          ),
        )
      ],
    );
  }

  InputDecoration getDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(top: 4, left: 8, bottom: 8),
      labelText: widget.placeholder,
      labelStyle: myFocusNode.hasFocus ? AppTheme.focusedLabelTextStyle : AppTheme.labelTextStyle,
      fillColor: Colors.white,
      border: InputBorder.none,
    );
  }

  OutlineInputBorder getTextFieldBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  void myFocusNodeListener() {
    if (myFocusNode.hasFocus) {
      widget.focused?.call();
    } else {
      widget.unFocused?.call();
    }
  }
}
