import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_shop/models/base_product.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../models/products.dart';
import '../../widgets/details/body.dart';

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  var _isLoading = false;
  var _isInit = true;

  @override
  Widget build(BuildContext context) {
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
          child: FutureBuilder(
              future: Provider.of<Products>(context).fetchProduct(),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ProductsListView(
                    count: snapshot.data.length,
                    product: snapshot.data,
                  );
                }
              }),
        ),
      ],
    );
  }
}

class ProductsListView extends StatelessWidget {
  ProductsListView({this.count, this.product});
  final int count;
  final List<BaseProduct> product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: count,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, DetailsBody.route,
                arguments: product[i].id);
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
                    aspectRatio: 1.025,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Hero(
                        tag: product[i].id,
                        child: FadeInImage(
                          fit: BoxFit.contain,
                          placeholder:
                              ExactAssetImage('assets/images/placeholder.png'),
                          image: NetworkImage(product[i].images),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    product[i].description,
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
                        '\$${product[i].price}',
                        style: TextStyle(
                          fontSize:
                              (18 / 375) * MediaQuery.of(context).size.width,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      // Consumer<BaseProduct>(
                      //   builder: (__, product, _) => Container(
                      //     padding: EdgeInsets.all((8 / 375) *
                      //         MediaQuery.of(context).size.width),
                      //     width: (28 / 375) *
                      //         MediaQuery.of(context).size.width,
                      //     height: (28 / 375) *
                      //         MediaQuery.of(context).size.width,
                      //     decoration: BoxDecoration(
                      //       color: product.isFavorite
                      //           ? kPrimaryColor.withOpacity(0.15)
                      //           : kSecondaryColor
                      //               .withOpacity(0.1),
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: SvgPicture.asset(
                      //       'assets/icons/Heart Icon_2.svg',
                      //       color: product.isFavorite
                      //           ? Color(0XFFFF4848)
                      //           : Color(0XFFD8DEE4),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
