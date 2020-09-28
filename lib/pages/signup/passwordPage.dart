import 'package:flutter/material.dart';
import '../../reusable_components/appbar/appbar.dart';
import '../../reusable_components/button/button.dart';
import 'helper.dart';
import 'usernamePage.dart';

class CreatePasswordPage extends StatefulWidget {
  @override
  _CreatePasswordPageState createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {

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
                  setText(text: 'Create a password'),
                  SetTextField(
                    text: 'Password',
                    inputType: TextInputType.text,
                  )
                ],
              ),
            ),
            setCounter(text: '2 of 4'),
            setLinearIndicator(value: 0.5),
            Button(
              text: 'Next',
              navigateTo: UsernamePage(),
            ),
          ],
        ),
      ),
    );
  }
}
