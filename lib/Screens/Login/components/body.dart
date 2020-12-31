import 'package:flutter/material.dart';
import 'package:Flutter_auth/Screens/Login/components/background.dart';
import 'package:Flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:Flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:Flutter_auth/components/rounded_button.dart';
import 'package:Flutter_auth/components/rounded_input_field.dart';
import 'package:Flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String emailField = "";
    String passwordField = "";

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
              hintText: "Your Email",
              onChanged: (value) {
                emailField = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                passwordField = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("email: " +
                          emailField +
                          "\npassword : " +
                          passwordField),
                    );
                  },
                );
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
