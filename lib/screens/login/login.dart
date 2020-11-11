import 'package:flutter/material.dart';

import '../../widgets/login/login_body.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/sign-in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SignIn'),
      ),
      body: LoginBody(),
    );
  }
}
