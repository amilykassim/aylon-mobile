import 'package:aylon_frontend/pages/setting/loadSettingList.dart';
import 'package:aylon_frontend/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../reusable_components/appbar/appbar.dart';
import '../../reusable_components/dropdown/myDropDownItem.dart';
import '../../utils/colors/colors.dart';
import 'changeSettingItem.dart';
import 'changeSettingPage.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<SettingItem> generalSettings;
  List<SettingItem> editProfileSettings;
  List<SettingItem> accountSettings;

  bool value;

  @override
  void initState() {
    loadList();
    value = false;
    super.initState();
  }

  loadList() {
    generalSettings = List();
    editProfileSettings = List();
    accountSettings = List(); 

    generalSettings = loadGeneralSettings();
    editProfileSettings = loadEditProfileSettings();
    accountSettings = loadAccountSettings();
  }

  void onChanged(bool isPulled, int index) {
    setState(() {
      generalSettings[index].isOn = isPulled;
    });
  }

  Widget _buildCheckBox(
      {String text,
      Icon icon,
      bool addArrow,
      bool isOn = false,
      Widget navigateTo,
      int index}) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            if (navigateTo != null)
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => navigateTo));
          },
          child: Container(
            margin: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //* Right Icon and title
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: icon,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: productSans,
                        ),
                      ),
                    ],
                  ),
                ),

                //* Icon or Switch widget
                Container(
                  margin: (addArrow == true)
                      ? EdgeInsets.all(10)
                      : EdgeInsets.only(right: 10),
                  child: (addArrow == true)
                      ? Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16,
                        )
                      : CupertinoSwitch(
                          activeColor: Colors.blue,
                          value: isOn,
                          onChanged: (bool isPulled) {
                            onChanged(isPulled, index);
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Divider(
            height: 10,
          ),
          margin: EdgeInsets.only(left: 56, right: 16),
        ),
      ],
    );
  }

  Widget _buildUpperTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 16, right: 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Hey Amily,',
          style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: productSans,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar(context: context, title: 'Settings', elevation: 1),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildUpperTitle(),
                Container(
                  margin: EdgeInsets.only(left: 16, bottom: 16, top: 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Here\'s your settings',
                    style: TextStyle(fontFamily: productSans, fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                ),

                //* GENERAL SETTINGS
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: generalSettings.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (ctx, i) {
                    return _buildCheckBox(
                      text: generalSettings[i].text,
                      icon: generalSettings[i].icon,
                      addArrow: generalSettings[i].addArrow,
                      isOn: generalSettings[i].isOn,
                      index: i,
                    );
                  },
                ),

                _buildHeaderSetting(text: 'PROFILE'),

                //* EDIT PROFILE SETTINGS
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: editProfileSettings.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (ctx, i) {
                    return _buildCheckBox(
                        text: editProfileSettings[i].text,
                        icon: editProfileSettings[i].icon,
                        addArrow: editProfileSettings[i].addArrow,
                        navigateTo: editProfileSettings[i].navigateTo);
                  },
                ),

                _buildHeaderSetting(text: 'ACCOUNT AND SUPPORT'),

                //* ACCOUNT AND SUPPORT SETTINGS
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: accountSettings.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (ctx, i) {
                    return _buildCheckBox(
                      text: accountSettings[i].text,
                      icon: accountSettings[i].icon,
                      addArrow: accountSettings[i].addArrow,
                      navigateTo: accountSettings[i].navigateTo,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSetting({String text}) {
    return Container(
      child: Text(
        text,
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
      margin: EdgeInsets.all(16),
    );
  }
}

class SettingItem {
  String text;
  Icon icon;
  bool addArrow;
  Widget navigateTo;
  bool isOn;

  SettingItem(
      {this.text, this.icon, this.addArrow, this.navigateTo, this.isOn});
}
