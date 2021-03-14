import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m_shop/models/categories.dart';

import '../models/product.dart';
import 'base_product.dart';

class Products with ChangeNotifier {
  List<Categories> _category = [
    Categories('1', 'Smartphone'),
    Categories('2', 'Fantasy'),
  ];

  List<BaseProduct> _demoProducts = [
    // BaseProduct(
    //   id: 1,
    //   images: [
    //     "assets/images/ps4_console_white_1.png",
    //     "assets/images/ps4_console_white_2.png",
    //     "assets/images/ps4_console_white_3.png",
    //     "assets/images/ps4_console_white_4.png",
    //   ],
    //   colors: [
    //     Color(0xFFF6625E),
    //     Color(0xFF836DB8),
    //     Color(0xFFDECB9C),
    //     Colors.white,
    //   ],
    //   title: "Wireless Controller for PS4™",
    //   price: 64.99,
    //   description: description,
    //   rating: 4.8,
    //   isPopular: true,
    // ),
    // BaseProduct(
    //   id: 2,
    //   images: [
    //     "assets/images/Image Popular Product 2.png",
    //   ],
    //   colors: [
    //     Color(0xFFF6625E),
    //     Color(0xFF836DB8),
    //     Color(0xFFDECB9C),
    //     Colors.white,
    //   ],
    //   title: "Nike Sport White - Man Pant",
    //   price: 50.5,
    //   description: description,
    //   rating: 4.1,
    //   isPopular: true,
    // ),
    // BaseProduct(
    //   id: 3,
    //   images: [
    //     "assets/images/glap.png",
    //   ],
    //   colors: [
    //     Color(0xFFF6625E),
    //     Color(0xFF836DB8),
    //     Color(0xFFDECB9C),
    //     Colors.white,
    //   ],
    //   title: "Gloves XC Omega - Polygon",
    //   price: 36.55,
    //   description: description,
    //   rating: 4.1,
    //   isPopular: true,
    // ),
    // BaseProduct(
    //   id: 4,
    //   images: [
    //     "assets/images/wireless headset.png",
    //     "assets/images/headset_2.png",
    //   ],
    //   colors: [
    //     Color(0xFFF6625E),
    //     Color(0xFF836DB8),
    //     Color(0xFFDECB9C),
    //     Colors.white,
    //   ],
    //   title: "Headset",
    //   price: 20.20,
    //   description: description,
    //   rating: 4.1,
    // ),
    // BaseProduct(
    //   id: 5,
    //   images: [
    //     "assets/images/mobile.png",
    //   ],
    //   colors: [
    //     Color(0xFFF6625E),
    //     Color(0xFF836DB8),
    //     Color(0xFFDECB9C),
    //     Colors.white,
    //   ],
    //   title: "Mobile Earphone",
    //   price: 20.20,
    //   description: description,
    //   rating: 4.1,
    // ),
  ];

  List<BaseProduct> getItems() {
    return [..._demoProducts];
  }

  List<Categories> getCat() {
    return [..._category];
  }

  Categories findbyCat(String id) {
    return _category.firstWhere((item) => item.id == id);
  }

  BaseProduct findById(int id) {
    return _demoProducts.firstWhere((item) => item.id == id,
        orElse: () => null);
  }

  int get getItemsCount {
    return _demoProducts.length;
  }

  int get getCatCount {
    return _category.length;
  }

  static const String description =
      "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

  Future<List<BaseProduct>> fetchProduct() async {
    final url =
        'https://mifileup.000webhostapp.com/backend/scripts/products/get_regular_products.php';
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        Product baseProduct = Product.fromJson(body);
        var baseProductList = baseProduct.jsonProducts
            .map((item) => BaseProduct.fromJson(item))
            .toList();
        _demoProducts = baseProductList;
        return _demoProducts;
      } else {
        print('Status Error is ${response.statusCode}');
      }
      notifyListeners();
    } catch (e) {
      print('Exception is $e');
    }
    return _demoProducts;
  }
}
