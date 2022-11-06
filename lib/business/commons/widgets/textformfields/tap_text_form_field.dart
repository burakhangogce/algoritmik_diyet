import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';

class TapTextFormField extends StatefulWidget {
  const TapTextFormField(this.controller,
      {this.placeholder,
      this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.obsecureText = false,
      required this.icon,
      this.isEnabled,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final String? placeholder;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final IconButton? suffixIcon;
  final bool obsecureText;
  final Icon icon;
  final bool? isEnabled;

  @override
  State<StatefulWidget> createState() => _TapTextFormFieldState();
}

class _TapTextFormFieldState extends State<TapTextFormField> {
  FocusNode myFocusNode = FocusNode();
  Color boxColor = softBorderColor;
  bool isError = false;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
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
    var deco = getDecoration(widget.icon);

    if (!deco.enabled) {
      boxColor = isError ? errorColor : softBorderColor;
    } else if (myFocusNode.hasFocus) {
      boxColor = isError ? errorColor : primaryColor;
    } else {
      boxColor = isError ? errorColor : softBorderColor;
    }

    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: boxColor),
              borderRadius: const BorderRadius.all(Radius.circular(7))),
        ),
        SizedBox(
          height: 73,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: TextFormField(
              obscureText: widget.obsecureText,
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
              autovalidateMode: widget.validator != null
                  ? AutovalidateMode.onUserInteraction
                  : null,
              readOnly: true,
              enabled: false,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              decoration: deco,
            ),
          ),
        )
      ],
    );
  }

  InputDecoration getDecoration(Icon icon) {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(top: 4, left: 8, bottom: 8),
      labelText: widget.placeholder,
      labelStyle: myFocusNode.hasFocus
          ? AppTheme.focusedLabelTextStyle
          : AppTheme.labelTextStyle,
      fillColor: Colors.white,
      suffixIcon: IconButton(
        iconSize: 25,
        icon: icon,
        onPressed: () => {
          widget.controller.clear(),
        },
      ),
      border: InputBorder.none,
      // focusedBorder: getTextFieldBorder(primaryColor),
      // disabledBorder: getTextFieldBorder(softBorderColor),
      // enabledBorder: getTextFieldBorder(softBorderColor),
      // errorBorder: getTextFieldBorder(errorColor),
      // focusedErrorBorder: getTextFieldBorder(errorColor),
    );
  }

  OutlineInputBorder getTextFieldBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}
