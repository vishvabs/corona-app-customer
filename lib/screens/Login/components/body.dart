import 'dart:developer';

import 'package:CT_Covid/controller/login/login_controller.dart';
import 'package:CT_Covid/model/login/login_body.dart';
import 'package:flutter/material.dart';
import 'package:CT_Covid/Screens/Login/components/background.dart';
import 'package:CT_Covid/Screens/Signup/signup_screen.dart';
import 'package:CT_Covid/components/already_have_an_account_acheck.dart';
import 'package:CT_Covid/components/rounded_button.dart';
import 'package:CT_Covid/components/rounded_input_field.dart';
import 'package:CT_Covid/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  final LoginController _loginController = LoginController();
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "NIC or Mobile number",
              onChanged: (value) {
                _controllerUsername.text = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _controllerPassword.text = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                String username = _controllerUsername.text.trim();
                String password = _controllerPassword.text.trim();
                _loginController
                    .add(LoginEvent(LoginBody(username, password, 'password')));
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
