import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../widgets/cart/cart_body.dart';
import '../../widgets/cart/check_out.dart';

class CartScreen extends StatelessWidget {
  static String route = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      bottomNavigationBar: CheckOutSection(cart),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Your Cart',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              '${cart.getCartCount} items',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      body: CartBody(),
    );
  }
}
