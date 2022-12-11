import 'package:flutter/material.dart';
import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_theme.dart';
import '../../../../../main.dart';
import '../dividers/ghost_divider.dart';
import 'mixin/show_sheet_mixin.dart';

abstract class IFilter {
  String get key;
  String get id;
}

class FilterView<T extends IFilter> extends StatefulWidget {
  const FilterView({
    Key? key,
    required List<T> values,
    this.textFieldHint,
    this.textTitle,
  })  : _values = values,
        super(key: key);

  final List<T> _values;
  final String? textFieldHint;
  final String? textTitle;

  @override
  State<FilterView> createState() => _FilterViewState<T>();
}

class _FilterViewState<T> extends State<FilterView> {
  late final List<IFilter> _filterValues;
  List<IFilter> filteredItems = [];
  TextEditingController editingControllerSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filterValues = widget._values;
    filteredItems = widget._values;
  }

  void _findItems(String value) {
    setState(() {
      filteredItems = _filterValues
          .where((element) =>
              element.key.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 26),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: widget.textFieldHint,
              fillColor: filterTextFieldColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
              suffixIcon: SizedBox(
                width: pageWidht / 3.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    editingControllerSearch.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              editingControllerSearch.clear();
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.transparent,
                            ),
                          )
                        : Container(),
                    const Icon(
                      Icons.search,
                      color: Colors.transparent,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onChanged: _findItems,
            controller: editingControllerSearch,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, filteredItems[index]);
                    },
                    behavior: HitTestBehavior.translucent,
                    key: Key('cekbanksindex$index-btn'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.only(right: 13.0),
                            child: Text(
                              filteredItems[index].key,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.notoSansReg16PrimaryText,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const DividerWidget(
                      color: ghostColor,
                      thickness: 1,
                      paddingTop: 16.5,
                      paddingBottom: 16.5)
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

extension FilterViewExtension on FilterView {
  Future<T?> showSheet<T extends IFilter>(
      {required BuildContext context,
      required List<T> items,
      required textFieldHint,
      required textTitle}) {
    return ShowSheetMixin.showCustomSheet<T>(
        context: context,
        showTitle: textTitle,
        child: FilterView<T>(
          values: items,
          textFieldHint: textFieldHint,
          textTitle: textTitle,
        ));
  }
}
