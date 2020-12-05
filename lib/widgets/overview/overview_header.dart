import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:m_shop/screens/cartScreen/cart_screen.dart';
import 'package:provider/provider.dart';

import './badge.dart';
import '../../constants.dart';
import '../../models/cart.dart';

class OverviewHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      height: (46 / 375) * (MediaQuery.of(context).size.height),
      padding: EdgeInsets.symmetric(
          horizontal: (20 / 375) * (MediaQuery.of(context).size.width)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search Item',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                    horizontal:
                        (20 / 375) * (MediaQuery.of(context).size.width),
                    vertical: (9 / 812) * (MediaQuery.of(context).size.height)),
              ),
            ),
          ),
          Container(
            width: (50 / 375) * (MediaQuery.of(context).size.width),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Badge(
              child: Container(
                height: 31,
                width: 15,
                child: GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icons/Bell.svg',
                  ),
                ),
              ),
              value: '0',
            ),
          ),
          Container(
            width: (46 / 375) * (MediaQuery.of(context).size.width),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Badge(
              child: Container(
                height: 31,
                width: 25,
                padding: EdgeInsets.all(2),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CartScreen.route);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/Cart Icon.svg',
                  ),
                ),
              ),
              value: cart.getCartCount.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
