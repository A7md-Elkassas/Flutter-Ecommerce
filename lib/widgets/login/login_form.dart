import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../screens/forgotPassword/forgot_password_screen.dart';
import '../../screens/overviewscreen/overview.dart';
import '../../shared_component/email_field.dart';
import '../../shared_component/password_field.dart';
import '../../shared_component/rounded_button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _key = GlobalKey<FormState>();

  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: _key,
        child: Column(
          children: [
            EmailField(
              label: 'Email',
              hintTxt: 'Enter Your Email',
              icon: 'assets/icons/Mail.svg',
            ),
            const SizedBox(height: 20),
            PasswordField(
              label: 'Password',
              hintTxt: 'Enter Your Password',
              icon: 'assets/icons/Lock.svg',
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Checkbox(
                    activeColor: kPrimaryColor,
                    value: remember,
                    onChanged: (value) {
                      setState(() {
                        remember = value;
                      });
                    }),
                Text('remember me'),
                Spacer(),
                FlatButton(
                  splashColor: Colors.transparent,
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: kPrimaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ForgotPasswordScreen.route);
                    //TODO:
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            RoundedButton(
              text: 'Login',
              click: () {
                if (_key.currentState.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => OverView(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
