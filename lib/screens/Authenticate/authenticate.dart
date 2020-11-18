import 'package:flutter/material.dart';

import '../../widgets/login/login_body.dart';

class AuthenticationScreen extends StatelessWidget {
  static const route = '/sign-in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticateBody(),
    );
  }
}
