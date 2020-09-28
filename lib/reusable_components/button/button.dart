import 'package:flutter/material.dart';

import '../../utils/colors/colors.dart';

class Button extends StatelessWidget {
  final Widget navigateTo;
  final String text;
  final Color color;

  Button({this.navigateTo, this.text, this.color = parentColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(25),
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigateTo));
        },
        color: this.color,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
