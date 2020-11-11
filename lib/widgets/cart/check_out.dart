import 'package:flutter/material.dart';

import '../../models/cart.dart';
import '../../shared_component/rounded_button.dart';

class CheckOutSection extends StatelessWidget {
  CheckOutSection(
    this.cart,
  );
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0XFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(TextSpan(text: 'Total : \n', children: [
            TextSpan(
              text: '\$${cart.getTotalAmount}',
            ),
          ])),
          SizedBox(
            width: 50,
          ),
          SizedBox(
            width: (190 / 375) * MediaQuery.of(context).size.width,
            child: RoundedButton(
              text: 'CheckOut',
              click: () {},
            ),
          ),
        ],
      ),
    );
  }
}
