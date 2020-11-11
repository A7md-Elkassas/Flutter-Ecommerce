import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../models/product.dart';

class ProductInfo extends StatelessWidget {
  final Product product;
  ProductInfo({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: (20 / 375) * MediaQuery.of(context).size.width),
            child: Text(
              product.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(height: 5),
          // Favorite button
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(
                  (15 / 375) * MediaQuery.of(context).size.width),
              decoration: BoxDecoration(
                color:
                    product.isFavorite ? Color(0XFFFFE6E6) : Color(0XFFD8DEE4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: SvgPicture.asset(
                'assets/icons/Heart Icon_2.svg',
                color:
                    product.isFavorite ? Color(0XFFFF4848) : Color(0XFFF5F6F9),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // Product Description
          Container(
            padding: EdgeInsets.only(
                left: (20 / 375) * MediaQuery.of(context).size.width,
                right: (65 / 375) * MediaQuery.of(context).size.width),
            child: Text(
              product.description,
              textAlign: TextAlign.justify,
              maxLines: 3,
              style: TextStyle(
                color: kTextColor,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (20 / 375) * MediaQuery.of(context).size.width,
              vertical: (20 / 375) * MediaQuery.of(context).size.width,
            ),
            child: GestureDetector(
              onTap: () {
                print('got it!!');
              },
              child: Row(
                children: [
                  Text(
                    'See More Details',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
