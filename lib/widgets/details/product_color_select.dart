import 'package:flutter/material.dart';
import '../../widgets/details/rounded_button.dart';

import './product_colors.dart';
import '../../models/product.dart';

class ColorSelect extends StatelessWidget {
  final Product product;

  ColorSelect(this.product);
  @override
  Widget build(BuildContext context) {
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
          ...List.generate(
              product.colors.length,
              (index) => ProductColors(
                    color: product.colors[index],
                    isSelected: selected == index,
                  )),
          Spacer(),
          RoundedButton(
            icon: Icons.remove,
            onPress: () {},
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
