import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../home/homePage.dart';
import 'coreMessage.dart';
import 'shareWithFriend.dart';
import 'welcomePage.dart';

class IntroductionPage extends StatelessWidget {

  List<Container> getPages(BuildContext context) {
    print('the context is $context');
    return [
      //! Welcome page, but refactor it later and make it re-usable
      getWelcomePage(),

      //! Found something you like page, but refactor it later and make it re-usable
      getCoreValueMessagePage(),

      //! share it with your friend page, but refactor it later and make it re-usable
      getShareWithFriendPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/secondPage': (BuildContext context) => new HomePage(),
      },
      home: Scaffold(
        body: LiquidSwipe(
          pages: getPages(context),
          enableLoop: false,
          fullTransitionValue: 500,
          enableSlideIcon: true,
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.5,
        ),
      ),
    );
  }
}
