import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import '../../utils/colors/colors.dart';

Container getCoreValueMessagePage() {
  final String chatAnimation = 'assets/chat_animation.flr';

  const TextStyle boldStyleWhite = TextStyle(
    fontSize: 37.0,
    color: Colors.white,
    fontFamily: productSans,
    fontWeight: FontWeight.bold,
  );

  const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontFamily: productSans,
  );

  const TextStyle descriptionWhiteStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: productSans,
  );

  return Container(
    color: Color(0xFF55006c),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Container(
            child: FlareActor(chatAnimation,
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "chat"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Found something you like?",
                style: boldStyleWhite,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Talk with the seller right away, \nwe hate getting into other people's business too.",
                style: descriptionWhiteStyle,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Swipe for one last thing\n",
                style: descriptionGreyStyle,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
