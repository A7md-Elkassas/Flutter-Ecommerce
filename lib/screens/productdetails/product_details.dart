import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/details/body.dart';
import '../../widgets/details/custom_app_bar.dart';

class ProductDetails extends StatefulWidget {
  static const route = '/product_details';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context).settings.arguments;
    // final product = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      backgroundColor: Color(0XFFF5F6F9),
      appBar: CustomAppBar(2.2),
      body: DetailsBody(),
    );
  }
}
