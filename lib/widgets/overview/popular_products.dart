import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../models/product.dart';
import '../../models/products.dart';
import '../../widgets/details/body.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).getItems();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (20 / 375) * MediaQuery.of(context).size.width,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Products'),
              FlatButton(
                child: Text('see more'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, i) {
              return ChangeNotifierProvider.value(
                value: products[i],
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DetailsBody.route,
                        arguments: products[i].id);
                  },
                  child: SizedBox(
                    width: (140 / 375) * MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: (15 / 375) * MediaQuery.of(context).size.width),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1.02,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kSecondaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset(
                                products[i].images[0],
                              ),
                            ),
                          ),
                          Text(
                            products[i].title,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${products[i].price}',
                                style: TextStyle(
                                  fontSize: (18 / 375) *
                                      MediaQuery.of(context).size.width,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                              Consumer<Product>(
                                builder: (ctx, product, _) => Container(
                                  padding: EdgeInsets.all((8 / 375) *
                                      MediaQuery.of(context).size.width),
                                  width: (28 / 375) *
                                      MediaQuery.of(context).size.width,
                                  height: (28 / 375) *
                                      MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: product.isFavorite
                                        ? kPrimaryColor.withOpacity(0.15)
                                        : kSecondaryColor.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/Heart Icon_2.svg',
                                    color: product.isFavorite
                                        ? Color(0XFFFF4848)
                                        : Color(0XFFD8DEE4),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
