import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  int id;
  String title, description;
  List<String> images;
  List<Color> colors;
  double price, rating;
  bool isFavorite, isPopular;
  List<String> category;

  Product(
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
}
