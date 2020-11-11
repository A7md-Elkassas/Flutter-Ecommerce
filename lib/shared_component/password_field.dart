import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final String hintTxt;
  final String icon;

  PasswordField({this.label, this.hintTxt, this.icon});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  String errorMsg(String str) {
    switch (widget.hintTxt) {
      case 'Enter Your Password':
        return 'password is empty';
    }
    return null;
  }

  bool isVisible = false;

  @override
  void initState() {
    isVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return errorMsg(widget.hintTxt);
        } else {
          return null;
        }
      },
      obscureText:
          isVisible && widget.hintTxt == 'Enter Your Password' ? true : false,
      decoration: kTextFieldDecoration.copyWith(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.label,
        labelStyle: TextStyle(color: Colors.black),
        hintText: widget.hintTxt,
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: SvgPicture.asset(
            widget.icon,
          ),
        ),
        suffixIcon: isVisible && widget.hintTxt == 'Enter Your Password'
            ? IconButton(
                icon: Icon(Icons.visibility_off),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    isVisible = false;
                  });
                },
              )
            : IconButton(
                icon: Icon(Icons.visibility),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    isVisible = true;
                  });
                }),
      ),
    );
  }
}
