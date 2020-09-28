import 'package:flutter/material.dart';
import '../../reusable_components/appbar/appbar.dart';
import '../../utils/colors/colors.dart';
import '../home/homePage.dart';
import '../interests/interestPage.dart';
import 'helper.dart';

class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  Widget _genderButton({double top, String label}) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: top, left: 50, right: 50),
      child: FlatButton(
        child: Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InterestPage()));
        },
        color: parentColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: setAppBar(context: context, title: 'What\'s your gender?', hideBackArrowIcon: true),
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
                  setText(text: 'This helps us find you more relevant content'),
                  _genderButton(top: 50.0, label: 'Male'),
                  _genderButton(top: 16.0, label: 'Female'),
                ],
              ),
            ),
            setCounter(text: '4 of 4'),
            setLinearIndicator(value: 1.0, marginBottom: 30.0),
          ],
        ),
      ),
    );
  }
}
