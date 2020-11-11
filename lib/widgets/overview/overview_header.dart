import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../screens/cartScreen/cart_screen.dart';

import '../../constants.dart';

class OverviewHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          IconBtn(
            iconSrc: 'assets/icons/Bell.svg',
            press: () {},
          ),
          IconBtn(
            iconSrc: 'assets/icons/Cart Icon.svg',
            press: () => Navigator.of(context).pushNamed(CartScreen.route),
          ),
        ],
      ),
    );
  }
}

class IconBtn extends StatelessWidget {
  final String iconSrc;
  final GestureTapCallback press;

  IconBtn({this.iconSrc, this.press});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(12 / 375) * (MediaQuery.of(context).size.width),
        width: (46 / 375) * (MediaQuery.of(context).size.width),
        height: (46 / 375) * (MediaQuery.of(context).size.height),
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          width: 20,
        ),
      ),
    );
  }
}
