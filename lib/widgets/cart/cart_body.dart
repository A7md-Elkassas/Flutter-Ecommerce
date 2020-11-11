import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart.dart';
import '../../widgets/cart/cart_item_card.dart';

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.getCartCount,
            itemBuilder: (ctx, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CartItemCard(
                    id: cart.getCartItem.keys.toList()[i],
                    productId: cart.getCartItem.values.toList()[i].id,
                    productImage: cart.getCartItem.values.toList()[i].image,
                    productTitle: cart.getCartItem.values.toList()[i].title,
                    productPrice:
                        cart.getCartItem.values.toList()[i].price.toString(),
                    productQuantity: cart.getCartItem.values
                        .toList()[i]
                        .quantity
                        .toString()),
              );
            },
          ),
        ),
      ],
    );
  }
}
