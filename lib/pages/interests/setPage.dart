import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import '../../utils/colors/colors.dart';
import '../home/startPage.dart';

class SetPage extends StatelessWidget {
  final String aylonLogo = 'assets/done_check.flr';

  Widget _buildBoldText() {
    return Container(
      child: Text(
        'All set for You',
        style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: productSans,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLightText() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Text(
        'Now you have, \nA 1000 shops in your hand',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontFamily: productSans,
        ),
      ),
    );
  }

  Widget _buildUpperLayout() {
    return Stack(
      children: <Widget>[
        Container(), //* THIS IS AN INVISIBLE PARENT THAT HELPS YOU LAYOUT YOUR BELOW WIDGETS
        Container(
          // color: Colors.blue,
          margin: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildBoldText(),
              _buildLightText(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _buildUpperLayout(),
              Expanded(
                flex: 1,
                child: Container(
                  child: SplashScreen.navigate(
                    name: aylonLogo,
                    next: (context) => StartPage(),
                    until: () => Future.delayed(Duration(seconds: 5)),
                    startAnimation: 'Animations',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
