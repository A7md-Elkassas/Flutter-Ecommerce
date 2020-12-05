import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../models/products.dart';
import '../../widgets/details/cart_button.dart';
import '../../widgets/details/custom_app_bar.dart';
import '../../widgets/details/product_color_select.dart';
import '../../widgets/details/product_info.dart';
import '../../widgets/details/product_picture.dart';

class DetailsBody extends StatelessWidget {
  static const route = '/details_body';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as int;
    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context);
    final GlobalKey<ScaffoldState> _scaffoldState =
        new GlobalKey<ScaffoldState>();
    void snackBarMsg() {
      SnackBar(
        content: Row(
          children: [
            Text('Item Added to cart'),
            Spacer(),
            Text('${cart.getTotalCartCount}'),
          ],
        ),
      );
    }

    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Color(0XFFF5F6F9),
      appBar: CustomAppBar(product.rating),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductPicture(product: product),
              ProductInfo(product: product),
              ColorSelect(product),
              CartButton(
                pressCallback: () {
                  Provider.of<Cart>(context, listen: false).addItem(
                      product.id.toString(),
                      product.title,
                      product.price,
                      product.images.first);
                  _scaffoldState.currentState.showSnackBar(new SnackBar(
                    content: Row(
                      children: [
                        Text('Item Added to cart'),
                        Spacer(),
                        Text('${cart.getTotalCartCount}'),
                      ],
                    ),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
