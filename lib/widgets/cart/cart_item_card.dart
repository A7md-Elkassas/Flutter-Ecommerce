import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../models/cart.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    @required this.productImage,
    @required this.productTitle,
    @required this.productPrice,
    @required this.productQuantity,
    @required this.productId,
    @required this.id,
  });

  final String productImage;
  final String productTitle;
  final String productPrice;
  final String productQuantity;
  final String productId;
  final String id;

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.productId),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: Text('Are You Sure'),
                content: Text('are you sure you want to remove this product ?'),
                actions: [
                  FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('no')),
                  FlatButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('yes')),
                ],
              );
            });
      },
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Color(0XFFFFE6E6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SvgPicture.asset('assets/icons/Trash.svg'),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: debugInstrumentationEnabled)
            .removeSingleItem(widget.productId);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(
              width: (88 / 375) * MediaQuery.of(context).size.width,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0XFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(widget.productImage),
                ),
              ),
            ),
            SizedBox(
              width: (20 / 375) * MediaQuery.of(context).size.width,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productTitle,
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                      text: '\$${widget.productPrice}',
                      style: TextStyle(color: kPrimaryColor),
                      children: [
                        TextSpan(
                          text: ' x${widget.productQuantity}',
                          style: TextStyle(color: kTextColor),
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
