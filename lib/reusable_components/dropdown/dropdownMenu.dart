import 'package:flutter/material.dart';

import 'myDropDownItem.dart';

class DropDown extends StatefulWidget {
  final List<MyDropDownItem> items;
  final ValueChanged<MyDropDownItem> myChoice;

  DropDown({Key key, this.items, this.myChoice}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<DropdownMenuItem<MyDropDownItem>> _dropdownMenuItems;
  MyDropDownItem _selectedItem;

  @override
  void initState() {
    _dropdownMenuItems = buildDropDownMenuItems(widget.items);

    // TODO: Initialize here with current MyDropDownItem when fetching data from the API
    _selectedItem = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<MyDropDownItem>> buildDropDownMenuItems(List items) {
    List<DropdownMenuItem<MyDropDownItem>> dropDownItems = List();
    for (MyDropDownItem item in items) {
      dropDownItems.add(
        DropdownMenuItem(
          value: item,
          child: Row(
            children: <Widget>[
              item.icon,
              SizedBox(
                width: 20,
              ),
              Text(item.name),
            ],
          ),
        ),
      );
    }

    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: _selectedItem,
        items: _dropdownMenuItems,
        onChanged: onChangeDropdownItem,
      ),
    );
  }

  void onChangeDropdownItem(MyDropDownItem selectedItem) {
    setState(() {
      _selectedItem = selectedItem;
      widget.myChoice(_selectedItem);
    });
  }
}
