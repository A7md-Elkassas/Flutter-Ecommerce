import 'package:flutter/material.dart';

import '../constants.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final String hintTxt;
  final String icon;
  final TextEditingController passwordController;
  final Widget child;
  final Function onSave;
  final Function onValidate;
  final bool enable;

  PasswordField({
    this.label,
    this.hintTxt,
    this.icon,
    this.passwordController,
    this.child,
    this.onSave(var value),
    this.onValidate(var value),
    this.enable,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;

  @override
  void initState() {
    isVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      enabled: widget.enable,
      controller: widget.passwordController,
      decoration: kTextFieldDecoration.copyWith(
        hintText: widget.hintTxt,
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: widget.child,
        ),
        suffixIcon: isVisible
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
      obscureText: isVisible ? true : false,
      validator: widget.onValidate,
      onSaved: widget.onSave,
    );
  }
}
