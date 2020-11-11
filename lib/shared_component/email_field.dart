import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class EmailField extends StatelessWidget {
  final String label;
  final String hintTxt;
  final String icon;

  EmailField({this.label, this.hintTxt, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        String errorMsg;
        if (value.isEmpty) {
          errorMsg = 'Your Email is Empty';
        } else {
          return null;
        }
        return errorMsg;
      },
      decoration: kTextFieldDecoration.copyWith(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        hintText: hintTxt,
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: SvgPicture.asset(
            icon,
          ),
        ),
      ),
    );
  }
}
