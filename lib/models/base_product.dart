import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseProduct with ChangeNotifier {
  static const appDomain = "https://mifileup.000webhostapp.com/";
  static const regularProductsImagesStorage =
      "$appDomain/backend/content/regular_products_images/";
  int id;
  String title, description;
  String images;
  List<Color> colors;
  double price, rating;
  bool isFavorite, isPopular;
  String category;

  BaseProduct(
      {this.id,
      this.title,
      this.description,
      this.images,
      this.colors,
      this.price,
      this.category,
      this.rating = 0.0,
      this.isFavorite = false,
      this.isPopular = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
    print('Status $isFavorite');
    notifyListeners();
  }

  factory BaseProduct.fromJson(Map<dynamic, dynamic> json) {
    return BaseProduct(
      id: int.parse(json['id']),
      title: json['owner_id'],
      description: json['description'],
      price: double.parse(json['price']),
      category: json['category'],
      images: regularProductsImagesStorage + json['id'] + '.jpg',
      rating: double.parse(json['rating']),
    );
  }
}
