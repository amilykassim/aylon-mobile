import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import '../../reusable_components/button/button.dart';
import '../../utils/colors/colors.dart';
import '../login/login.dart';

Container getShareWithFriendPage() {
  final String showItToYourFriends = 'assets/show_it_to_your_friends.flr';

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
            child: FlareActor(showItToYourFriends,
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "click"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "If you like it!",
                style: boldStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Show it to your friends",
                style: greyStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Let\'s have fun!',
                style: descriptionGreyStyle,
              ),
              SizedBox(
                height: 10.0,
              ),

              //* button of let's finish
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Button(navigateTo: LoginPage(), text: 'Start Now'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
