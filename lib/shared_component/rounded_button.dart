import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final GestureTapCallback click;

  RoundedButton({this.text, this.click});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (56 / 375) * MediaQuery.of(context).size.width,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kPrimaryColor,
        onPressed: click,
        child: Text(
          text,
          style: TextStyle(
            fontSize: (18 / 375) * MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
