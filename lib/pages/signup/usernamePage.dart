import 'package:flutter/material.dart';
import '../../reusable_components/appbar/appbar.dart';
import '../../reusable_components/button/button.dart';
import 'genderPage.dart';
import 'helper.dart';

class UsernamePage extends StatefulWidget {
  @override
  _UsernamePageState createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
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
                  setText(text: 'What\'s your username?'),
                  SetTextField(text: 'Username'),
                ],
              ),
            ),
            setCounter(text: '3 of 4'),
            setLinearIndicator(value: 0.75),
            Button(text: 'Next', navigateTo: GenderPage(),),
          ],
        ),
      ),
    );
  }
}
