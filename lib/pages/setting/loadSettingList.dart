import 'package:aylon_frontend/pages/setting/changeSettingItem.dart';
import 'package:aylon_frontend/pages/setting/changeSettingPage.dart';
import 'package:aylon_frontend/reusable_components/dropdown/myDropDownItem.dart';
import 'package:aylon_frontend/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:aylon_frontend/pages/setting/settingPage.dart';
import 'package:flutter_icons/flutter_icons.dart';

List<SettingItem> loadEditProfileSettings() {
  List<SettingItem> editProfileSettings = List();

  editProfileSettings.add(
    SettingItem(
      text: 'Edit profile',
      icon: Icon(Icons.person),
      addArrow: true,
      navigateTo: ChangeSettingPage(title: 'Edit profile', changeSettingItems: [
        ChangeSettingItem(
          label: 'Username',
          inputType: TEXT_INPUT_TYPE,
          prefillValue: 'amilykadyl mars',
        ),
        ChangeSettingItem(
          label: 'Gender',
          inputType: DROP_DOWN_TYPE,
          dropDownValues: [
            MyDropDownItem(
              id: 1,
              name: 'Male',
              icon: Icon(FontAwesome.male),
            ),
            MyDropDownItem(
              id: 2,
              name: 'Female',
              icon: Icon(FontAwesome.female),
            ),
            MyDropDownItem(
              id: 3,
              name: 'check',
              icon: Icon(FontAwesome.female),
            ),
          ],
        ),
      ]),
    ),
  );

  editProfileSettings.add(SettingItem(
    text: 'Change phone number',
    icon: Icon(Icons.phone),
    addArrow: true,
    navigateTo:
        ChangeSettingPage(title: 'Change phone number', changeSettingItems: [
      ChangeSettingItem(
        label: 'Current',
        inputType: TEXT_INPUT_TYPE,
        prefillValue: '0782228870',
      ),
      ChangeSettingItem(
        label: 'New',
        inputType: TEXT_INPUT_TYPE,
      ),
    ]),
  ));

  editProfileSettings.add(SettingItem(
    text: 'Change password',
    icon: Icon(Icons.lock),
    addArrow: true,
    navigateTo:
        ChangeSettingPage(title: 'Change Password', changeSettingItems: [
      ChangeSettingItem(
        label: 'Current',
        inputType: TEXT_INPUT_TYPE,
      ),
      ChangeSettingItem(
        label: 'New',
        inputType: TEXT_INPUT_TYPE,
      ),
    ]),
  ));

  return editProfileSettings;
}

List<SettingItem> loadGeneralSettings() {
  List<SettingItem> generalSettings = List();

  generalSettings.add(SettingItem(
    text: 'Dark mode',
    icon: Icon(FontAwesome.moon_o),
    addArrow: false,
    isOn: false,
  ));
  generalSettings.add(SettingItem(
    text: 'Show notification',
    icon: Icon(Icons.notifications_active),
    addArrow: false,
    isOn: false,
  ));

  return generalSettings;
}

List<SettingItem> loadAccountSettings() {
  List<SettingItem> accountSettings = List();

  // // TODO: ALLOW THIS SETTING ONLY FOR SELLERS
  // accountSettings.add(SettingItem(
  //   text: 'Request verification badge',
  //   icon: Icon(Icons.verified_user),
  //   addArrow: true,
  //   navigateTo: ChangeSettingPage(title: 'Request verification badge'),
  // ));

  // accountSettings.add(SettingItem(
  //   text: 'Become a seller',
  //   icon: Icon(Icons.monetization_on),
  //   addArrow: true,
  //   navigateTo:  ChangeSettingPage(title: 'Become a seller', changeSettingItems: [
  //     ChangeSettingItem(
  //       label: 'Current',
  //       inputType: TEXT_INPUT_TYPE,
  //     ),
  //     ChangeSettingItem(
  //       label: 'New',
  //       inputType: TEXT_INPUT_TYPE,
  //     ),
  //   ]),
  // ));

  accountSettings.add(SettingItem(
    text: 'Request a functionality',
    icon: Icon(Icons.phone),
    addArrow: true,
    navigateTo: ChangeSettingPage(
        title: 'Request a functionality',
        changeSettingItems: [
          ChangeSettingItem(
            label: 'Title',
            inputType: TEXT_INPUT_TYPE,
          ),
          ChangeSettingItem(
            label: 'Description',
            inputType: TEXT_INPUT_TYPE,
          ),
        ]),
  ));
  accountSettings.add(SettingItem(
    text: 'Report a problem',
    icon: Icon(Icons.report_problem),
    addArrow: true,
    navigateTo:
        ChangeSettingPage(title: 'Report a problem', changeSettingItems: [
      ChangeSettingItem(
        label: 'Title',
        inputType: TEXT_INPUT_TYPE,
      ),
      ChangeSettingItem(
        label: 'Description',
        inputType: TEXT_INPUT_TYPE,
      ),
    ]),
  ));
  accountSettings.add(SettingItem(
    text: 'Terms & Privacy policy',
    icon: Icon(Icons.import_contacts),
    addArrow: true,
  ));
  accountSettings.add(SettingItem(
    text: 'Log out',
    icon: Icon(Icons.trending_flat),
    addArrow: true,
  ));

  return accountSettings;
}
