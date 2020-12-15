import 'package:flutter/material.dart';

import '../constants.dart';

class EmailField extends StatelessWidget {
  final String label;
  final String hintTxt;
  final Widget child;
  final Function onSave;

  EmailField({
    this.label,
    this.hintTxt,
    this.child,
    this.onSave(var x),
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: kTextFieldDecoration.copyWith(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintTxt,
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: child,
        ),
      ),
      validator: (value) {
        String errorMsg;
        if (value.isEmpty || !value.contains('@')) {
          errorMsg = 'Invalid Email';
        }
        return errorMsg;
      },
      onSaved: onSave,
    );
  }
}
