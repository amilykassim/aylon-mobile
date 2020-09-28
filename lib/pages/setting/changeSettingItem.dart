import 'package:flutter/material.dart';
import '../../reusable_components/dropdown/myDropDownItem.dart';

class ChangeSettingItem {
  String label;
  String inputType;
  List<MyDropDownItem> dropDownValues;
  String prefillValue;

  ChangeSettingItem(
      {@required this.label,
      @required this.inputType,
      this.dropDownValues,
      this.prefillValue});
}
