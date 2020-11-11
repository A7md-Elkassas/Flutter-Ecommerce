import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/forgot_password/forgot_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const route = '/forgot-password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.all((20 / 375) * MediaQuery.of(context).size.width),
          child: Column(
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Please enter your email and we will send \nyou a link to return to your account',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              ForgotPasswordForm(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'SignUp',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
