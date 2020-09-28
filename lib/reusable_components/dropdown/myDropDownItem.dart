import 'package:flutter/material.dart';

class MyDropDownItem {
  int id;
  String name;
  Icon icon;

  MyDropDownItem({this.id, this.name, this.icon});

  static List<MyDropDownItem> getMyDropDownItems(List<MyDropDownItem> dropDownData) {
    return dropDownData;
  }
}
