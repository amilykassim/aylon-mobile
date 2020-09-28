import 'package:flutter/material.dart';
import '../../reusable_components/appbar/appbar.dart';
import '../../reusable_components/button/button.dart';
import 'helper.dart';
import 'verifyPhonePage.dart';

class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: setAppBar(context: context, title: 'Sign up'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  setText(text: 'What\'s your phone number?'),
                  SetTextField(text: 'Phone number', inputType: TextInputType.number),
                ],
              ),
            ),
            setCounter(text: '1 of 4'),
            setLinearIndicator(value: 0.25),
            Button(
              text: 'Next',
              navigateTo: VerifyPhonePage(),
            ),
          ],
        ),
      ),
    );
  }
}
