import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../reusable_components/button/button.dart';
import '../../reusable_components/input/input.dart';
import '../../utils/colors/colors.dart';
import '../home/homePage.dart';
import '../signup/phonePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(16),
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'AYlon',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico'),
                    ),
                  ),
                  Input(
                    label: 'Phone number or username',
                    inputType: TextInputType.number,
                    icon: Icons.phone,
                  ),
                  Input(
                    label: 'Password',
                    inputType: TextInputType.text,
                    icon: Icons.lock,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Forgot password?',
                          style: TextStyle(color: childColor),
                        ),
                      ],
                    ),
                  ),
                  Button(
                    text: 'Login',
                    navigateTo: HomePage(),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Don\'t have an Account? '),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhonePage(),
                              ),
                            );
                          },
                          child: new Text(
                            "Sign up",
                            style: TextStyle(color: childColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
