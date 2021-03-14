import 'package:flutter/material.dart';
import 'package:m_shop/models/products.dart';
import 'package:provider/provider.dart';

import '../../models/base_product.dart';
import '../../widgets/details/rounded_button.dart';

class ColorSelect extends StatefulWidget {
  final BaseProduct product;

  ColorSelect(this.product);

  @override
  _ColorSelectState createState() => _ColorSelectState();
}

class _ColorSelectState extends State<ColorSelect> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Products>(context);
    int selected = 1;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: (20 / 375) * MediaQuery.of(context).size.width,
          vertical: (20 / 375) * MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          // ...List.generate(
          //     widget.product.colors.length,
          //     (index) => ProductColors(
          //           color: widget.product.colors[index],
          //           isSelected: selected == index,
          //         )),
          Spacer(),
          RoundedButton(
            icon: Icons.remove,
            onPress: () {
              setState(() {
                selected--;
              });
            },
          ),
          SizedBox(
            width: 20,
          ),
          RoundedButton(
            icon: Icons.add,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
