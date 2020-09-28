import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../reusable_components/appbar/appbar.dart';
import '../../reusable_components/dropdown/dropdownMenu.dart';
import '../../reusable_components/dropdown/myDropDownItem.dart';
import '../../utils/colors/colors.dart';
import '../../utils/constants.dart';

class ChangeSettingPage extends StatefulWidget {
  final String title;
  final List changeSettingItems;

  ChangeSettingPage({
    Key key,
    @required this.title,
    @required this.changeSettingItems,
  }) : super(key: key);

  @override
  _ChangeSettingPageState createState() => _ChangeSettingPageState();
}

class _ChangeSettingPageState extends State<ChangeSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: setAppBar(
          title: widget.title, context: context, elevation: 1, isSetting: true),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              for (var changeSettingItem in widget.changeSettingItems)
                _toggleType(
                    inputType: changeSettingItem.inputType,
                    item: changeSettingItem,
                    dropDownValues: changeSettingItem.dropDownValues)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {@required String label,
      String text = '',
      bool isDropdown = false,
      List<MyDropDownItem> dropDownValues}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontFamily: productSans),
            ),
          ),
          (isDropdown == true)
              ? Expanded(
                  flex: 2,
                  child: DropDown(
                    items: MyDropDownItem.getMyDropDownItems(dropDownValues),
                    myChoice: (MyDropDownItem value) {
                      setState(() {
                        print('>>>> THE SELECTED ITEM IS : ${value.name}');
                      });
                    },
                  ),
                )
              : Expanded(
                  flex: 2,
                  child: TextFormField(
                    initialValue: text,
                    autofocus: false,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _toggleType({String inputType, item, dropDownValues}) {
    switch (inputType) {
      case DROP_DOWN_TYPE:
        return _buildTextField(
          label: item.label,
          isDropdown: true,
          dropDownValues: dropDownValues,
        );
        break;
      default:
        return _buildTextField(
          label: item.label,
          text: item.prefillValue,
        );
    }
  }
}
