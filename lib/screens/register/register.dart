import 'package:flutter/material.dart';

import '../../widgets/register/register_body.dart';

class Register extends StatelessWidget {
  static const route = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SignUp'),
      ),
      body: RegisterBody(),
    );
  }
}
