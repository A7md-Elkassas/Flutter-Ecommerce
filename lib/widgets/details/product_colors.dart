import 'package:flutter/material.dart';

import '../../constants.dart';

class ProductColors extends StatelessWidget {
  final Color color;
  final bool isSelected;

  ProductColors({this.color, this.isSelected = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (40 / 375) * MediaQuery.of(context).size.width,
      height: (40 / 375) * MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
