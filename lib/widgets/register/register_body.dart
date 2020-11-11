import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';

import '../../shared_component/email_field.dart';
import '../../shared_component/password_field.dart';
import '../../shared_component/rounded_button.dart';
import '../../widgets/login/social_icon.dart';

class RegisterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Register Account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Complete your details or continue \nwith social media',
                textAlign: TextAlign.center,
              ),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            EmailField(
              label: 'Email',
              hintTxt: 'Enter Your Email',
              icon: 'assets/icons/Mail.svg',
            ),
            const SizedBox(height: 30),
            PasswordField(
              label: 'Password',
              hintTxt: 'Enter Your Password',
              icon: 'assets/icons/Lock.svg',
            ),
            const SizedBox(height: 30),
            PasswordField(
              label: 'Confirm Password',
              hintTxt: 'Enter Your Password',
              icon: 'assets/icons/Lock.svg',
            ),
            const SizedBox(height: 40),
            RoundedButton(
              text: 'Continue',
              click: () {
                if (_key.currentState.validate()) {
                  //TODO:
                }
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  icon: 'assets/icons/facebook-2.svg',
                  click: () {},
                ),
                SocialIcon(
                  icon: 'assets/icons/google-icon.svg',
                  click: () {},
                ),
                SocialIcon(
                  icon: 'assets/icons/twitter.svg',
                  click: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'By continuing your confirm that you agree \nwith our Term and Condition',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
