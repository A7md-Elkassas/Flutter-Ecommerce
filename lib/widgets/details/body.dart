import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../models/products.dart';
import '../../widgets/details/cart_button.dart';
import '../../widgets/details/product_color_select.dart';
import '../../widgets/details/product_info.dart';
import '../../widgets/details/product_picture.dart';

class DetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context);
    Text snackBarmsg() {}
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProductPicture(product: product),
            ProductInfo(product: product),
            ColorSelect(product),
            CartButton(pressCallback: () {
              Provider.of<Cart>(context, listen: false).addItem(
                  productId.toString(),
                  product.title,
                  product.price,
                  product.images.first);
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Row(
                  children: [
                    Text('Item Added to cart'),
                    Spacer(),
                    Text('${cart.getTotalCartCount}'),
                  ],
                ),
              ));
            }),
          ],
        ),
      ),
    );
  }
}
