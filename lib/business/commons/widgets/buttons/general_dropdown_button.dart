import 'package:flutter/material.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';

class GeneralDropDownButton extends StatefulWidget {
  final List<DropdownMenuItem<dynamic>>? items;
  final String? labelText;
  final Function(dynamic)? onchanged;
  final dynamic value;
  final Color borderColor;
  const GeneralDropDownButton(
      {Key? key,
      this.items,
      this.labelText,
      this.onchanged,
      this.value,
      this.borderColor = softBorderColor})
      : super(key: key);

  @override
  State<GeneralDropDownButton> createState() => _GeneralDropDownButtonState();
}

class _GeneralDropDownButtonState extends State<GeneralDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 53,
          decoration: BoxDecoration(
              border: Border.all(color: widget.borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(7))),
          child: const Padding(
            padding: EdgeInsets.only(right: 14.0),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Icon(Icons.keyboard_arrow_down),
            ),
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.transparent,
            ),
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                border: InputBorder.none,
                labelText: widget.labelText,
                labelStyle: AppTheme.focusedLabelTextStyle),
            items: widget.items,
            value: widget.value,
            onChanged: widget.onchanged,
          ),
        ),
      ],
    );
  }
}
