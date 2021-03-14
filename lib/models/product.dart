class Product {
  List<dynamic> jsonProducts;
  Product({this.jsonProducts});
  factory Product.fromJson(List<dynamic> json) {
    return Product(
      jsonProducts: json,
    );
  }
}
