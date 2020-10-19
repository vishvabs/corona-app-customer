import 'package:flutter/material.dart';
import 'package:CT_Covid/Screens/Login/login_screen.dart';
import 'package:CT_Covid/Screens/Signup/components/background.dart';
import 'package:CT_Covid/Screens/Signup/components/or_divider.dart';
import 'package:CT_Covid/Screens/Signup/components/social_icon.dart';
import 'package:CT_Covid/components/already_have_an_account_acheck.dart';
import 'package:CT_Covid/components/rounded_button.dart';
import 'package:CT_Covid/components/rounded_input_field.dart';
import 'package:CT_Covid/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "NIC or Mobile number",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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
