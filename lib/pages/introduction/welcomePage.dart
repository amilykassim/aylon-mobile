import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import '../../utils/colors/colors.dart';

Container getWelcomePage() {
  final String girlOnBoarding = 'assets/girl_on_boarding.flr';
  final String swipeLeft = 'assets/swipe_left.flr';

  const TextStyle greyStyle = TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: productSans);

  const TextStyle boldStyle = TextStyle(
    fontSize: 37.0,
    color: Colors.black,
    fontFamily: productSans,
    fontWeight: FontWeight.bold,
  );

  const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontFamily: productSans,
  );

  return Container(
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Container(
            child: FlareActor(girlOnBoarding,
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "Swing"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Welcome to Aylon!",
                style: boldStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "With Aylon, You can enter over 1000 shops in kigali, while you're in your bedroom",
                style: greyStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "It's free and easy to use",
                style: greyStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Swipe left",
                style: descriptionGreyStyle,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: FlareActor(swipeLeft,
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "Animations"),
          ),
        ),
      ],
    ),
  );
}
