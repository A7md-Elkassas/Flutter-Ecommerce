import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared_component/email_field.dart';
import '../../shared_component/rounded_button.dart';

class ForgotPasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: (20 / 375) * MediaQuery.of(context).size.width),
      child: Form(
        key: _key,
        child: Column(
          children: [
            EmailField(
              label: 'Email',
              hintTxt: 'Enter Your Email',
              child: SvgPicture.asset(
                'assets/icons/Mail.svg',
              ),
            ),
            const SizedBox(height: 30),
            RoundedButton(
              text: 'Continue',
              click: () {
                if (_key.currentState.validate()) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
