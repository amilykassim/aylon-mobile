import 'package:flutter/material.dart';
import '../../utils/colors/colors.dart';

class Input extends StatefulWidget {
  final String label;
  final TextInputType inputType;
  final IconData icon;

  Input({Key key, this.label, this.inputType, this.icon}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
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
      ),
      onPressed: () {
        _togglePasswordVisibility();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(16),
      child: TextFormField(
        autofocus: false,
        keyboardType: widget.inputType,
        obscureText: widget.label.toLowerCase() == 'password'
            ? _isPasswordHidden
            : false,
        decoration: InputDecoration(
          labelText: widget.label,
          focusColor: parentColor,
          prefixIcon: Icon(
            widget.icon,
            color: Colors.grey.shade400,
            size: 20,
          ),
          suffixIcon: widget.label.toLowerCase() == 'password'
              ? _toggleVisibilityIcon()
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),

        // TODO: VALIDATE THE INPUTS
        validator: (val) {
          if (val.length == 0) {
            return "${widget.label} is required";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
