import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _demoProducts = [
    Product(
      id: 1,
      images: [
        "assets/images/ps4_console_white_1.png",
        "assets/images/ps4_console_white_2.png",
        "assets/images/ps4_console_white_3.png",
        "assets/images/ps4_console_white_4.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Wireless Controller for PS4™",
      price: 64.99,
      description: description,
      rating: 4.8,
      isFavorite: true,
      isPopular: true,
    ),
    Product(
      id: 2,
      images: [
        "assets/images/Image Popular Product 2.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Nike Sport White - Man Pant",
      price: 50.5,
      description: description,
      rating: 4.1,
      isPopular: true,
    ),
    Product(
      id: 3,
      images: [
        "assets/images/glap.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Gloves XC Omega - Polygon",
      price: 36.55,
      description: description,
      rating: 4.1,
      isFavorite: true,
      isPopular: true,
    ),
    Product(
      id: 4,
      images: [
        "assets/images/wireless headset.png",
        "assets/images/headset_2.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Headset",
      price: 20.20,
      description: description,
      rating: 4.1,
      isFavorite: true,
    ),
    Product(
      id: 5,
      images: [
        "assets/images/mobile.png",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Mobile Earphone",
      price: 20.20,
      description: description,
      rating: 4.1,
      isFavorite: true,
    ),
  ];

  List<Product> getItems() {
    return [..._demoProducts];
  }

  Product findById(int id) {
    return _demoProducts.firstWhere((item) => item.id == id);
  }

  int get getItemsCount {
    return _demoProducts.length;
  }

  static const String description =
      "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
}
