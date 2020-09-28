import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import '../introduction/introductionPage.dart';

class SplashPage extends StatelessWidget {
  final String aylonLogo = 'assets/aylon_logo.flr';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: SplashScreen.navigate(
                  name: aylonLogo,
                  next: (context) => IntroductionPage(),
                  until: () => Future.delayed(Duration(seconds: 1)),
                  startAnimation: 'loading',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'A 1000 Shops in your hand',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
