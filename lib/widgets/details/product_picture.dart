import 'package:flutter/material.dart';

import '../../models/base_product.dart';

class ProductPicture extends StatefulWidget {
  final BaseProduct product;
  ProductPicture({this.product});

  @override
  _ProductPictureState createState() => _ProductPictureState();
}

class _ProductPictureState extends State<ProductPicture> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: (238 / 375) * MediaQuery.of(context).size.width,
          child: Hero(
            tag: widget.product.id,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                widget.product.images,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ...List.generate(
              //     widget.product.images.length,
              //     (index) => Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: GestureDetector(
              //             onTap: () {
              //               setState(() {
              //                 selected = index;
              //               });
              //             },
              //             child: Container(
              //               padding: EdgeInsets.all(8),
              //               width:
              //                   (48 / 375) * MediaQuery.of(context).size.width,
              //               height:
              //                   (48 / 375) * MediaQuery.of(context).size.width,
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(10),
              //                   border: Border.all(
              //                     color: selected == index
              //                         ? kSecondaryColor
              //                         : Colors.transparent,
              //                   )),
              //               child: Image.asset(widget.product.images[index]),
              //             ),
              //           ),
              //         )),
            ],
          ),
        ),
      ],
    );
  }
}
