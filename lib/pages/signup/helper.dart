import 'package:flutter/material.dart';
import '../../utils/colors/colors.dart';

Text setText({text}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 28, fontFamily: productSans, fontWeight: FontWeight.bold),
  );
}

Container setCounter({text}) {
  return Container(
    alignment: Alignment.topRight,
    margin: EdgeInsets.only(right: 30, bottom: 10),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: productSans,
          fontWeight: FontWeight.bold),
    ),
  );
}

Container setLinearIndicator({value, marginBottom = 0.0}) {
  return Container(
    margin: EdgeInsets.only(left: 30, right: 30, bottom: marginBottom),
    child: LinearProgressIndicator(
      backgroundColor: Colors.grey,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black,
      ),
      value: value,
    ),
  );
}

class SetTextField extends StatefulWidget {
  final TextInputType inputType;
  final String text;

  SetTextField({this.inputType, this.text});

  @override
  _SetTextFieldState createState() => _SetTextFieldState();
}

class _SetTextFieldState extends State<SetTextField> {
  double _iconSize = 20;
  bool _isPasswordHidden = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  Widget _toggleVisibilityIcon() {
    return IconButton(
      icon: Icon(
        _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
        size: _iconSize,
        color: Colors.black,
      ),
      onPressed: () {
        _togglePasswordVisibility();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: widget.inputType,
      obscureText:
          widget.text.toLowerCase() == 'password' ? _isPasswordHidden : false,
      textInputAction: TextInputAction.next,
      cursorColor: parentColor,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hintText: widget.text,
        border: InputBorder.none,
        suffixIcon: widget.text.toLowerCase() == 'password'
            ? _toggleVisibilityIcon()
            : null,
      ),
      // TODO: VALIDATE PASSWORD
    );
  }
}
