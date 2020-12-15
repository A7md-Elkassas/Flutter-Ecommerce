import 'package:flutter/material.dart';

import '../../constants.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color color;
  Badge({this.child, this.color, this.value});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          left: 28,
          bottom: 16,
          child: Container(
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: color != null ? color : kPrimaryColor,
            ),
            constraints: BoxConstraints(
              minWidth: 15,
              minHeight: 5,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
