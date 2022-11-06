import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_theme.dart';

class MainButtonGroup extends StatefulWidget {
  const MainButtonGroup(
      {required this.buttons,
      this.selectedColor = secondaryColor,
      this.unSelectedColor = softBorderColor,
      this.textStyle,
      this.borderColor,
      this.borderWidth,
      this.selectedTextColor,
      this.unSelectedTextColor,
      this.spacing = 10,
      this.uSelectedIndex,
      this.padding = EdgeInsets.zero,
      required this.onchanged,
      Key? key})
      : super(key: key);

  final List<String> buttons;
  final Color selectedColor;
  final Color unSelectedColor;
  final TextStyle? textStyle;
  final Color? selectedTextColor;
  final Color? unSelectedTextColor;
  final Color? borderColor;
  final double? borderWidth;
  final double spacing;
  final int? uSelectedIndex;
  final EdgeInsets padding;
  final Function(int index) onchanged;

  @override
  State<MainButtonGroup> createState() => _MainButtonGroupState();
}

class _MainButtonGroupState extends State<MainButtonGroup> {
  late int _selectedIndex;
  late BorderSide? borderSide;
  late TextStyle _selectedTextStyle;
  late TextStyle _unSelectedtextStyle;

  @override
  void initState() {
    if (widget.uSelectedIndex == null) {
      _selectedIndex = 0;
    } else {
      _selectedIndex = widget.uSelectedIndex!;
    }

    if (widget.textStyle != null) {
      _selectedTextStyle = widget.textStyle!;
      _unSelectedtextStyle = widget.textStyle!;
    } else {
      _selectedTextStyle = AppTheme.notoSansReg14PrimaryText;
      _unSelectedtextStyle = AppTheme.notoSansReg14PrimaryText;
    }

    if (widget.selectedTextColor != null) {
      _selectedTextStyle =
          _selectedTextStyle.copyWith(color: widget.selectedTextColor!);
    }

    if (widget.unSelectedTextColor != null) {
      _unSelectedtextStyle =
          _unSelectedtextStyle.copyWith(color: widget.unSelectedTextColor!);
    }

    if (widget.borderColor != null) {
      borderSide = BorderSide(
        color: widget.borderColor!,
        width: widget.borderWidth == null ? 1.0 : widget.borderWidth!,
      );
    } else {
      borderSide = null;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle getButtonStyle(int index) {
      var buttonstyle = ElevatedButton.styleFrom(
        foregroundColor: overlayDarkColor,
        backgroundColor: _selectedIndex == index
            ? widget.selectedColor
            : widget.unSelectedColor,
        fixedSize: const Size.fromHeight(40),
        side: borderSide,
        shape: index == 0
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              )
            : index == widget.buttons.length - 1
                ? const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  )
                : const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
      );
      return buttonstyle;
    }

    List<Widget> children = [];
    for (var index = 0; index < widget.buttons.length; index++) {
      var button = Expanded(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedIndex = index;
              widget.onchanged(index);
            });
          },
          style: getButtonStyle(index),
          child: Text(
            widget.buttons[index],
            style: _selectedIndex == index
                ? _selectedTextStyle
                : _unSelectedtextStyle,
          ),
        ),
      );
      children.add(button);
      if (widget.buttons.length - 1 > index) {
        children.add(SizedBox(width: widget.spacing));
      }
    }

    return Padding(
      padding: widget.padding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: children,
      ),
    );
  }
}
