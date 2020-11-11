import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  int id;
  String title, description;
  List<String> images;
  List<Color> colors;
  double price, rating;
  bool isFavorite, isPopular;

  Product(
      {this.id,
      this.title,
      this.description,
      this.images,
      this.colors,
      this.price,
      this.rating = 0.0,
      this.isFavorite = false,
      this.isPopular = false});
}
