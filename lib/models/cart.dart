import 'package:flutter/cupertino.dart';
import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _cart = {};

  Map<String, CartItem> get getCartItem {
    return {..._cart};
  }

  int get getCartCount {
    return _cart.length;
  }

  int get getTotalCartCount {
    int count = 0;
    _cart.forEach((key, item) {
      count += item.quantity;
    });
    return count;
  }

  double get getTotalAmount {
    double total = 0.0;
    _cart.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void addItem(String productId, String productTitle, double productPrice,
      String productImg) {
    if (_cart.containsKey(productId)) {
      _cart.update(
          productId,
          (currentValue) => CartItem(
                id: currentValue.id,
                title: currentValue.title,
                price: currentValue.price,
                quantity: currentValue.quantity + 1,
                image: currentValue.image,
              ));
    } else {
      _cart.putIfAbsent(
          productId,
          () => CartItem(
                id: productId,
                title: productTitle,
                price: productPrice,
                image: productImg,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_cart.containsKey(id)) {
      return;
    } else if (_cart.length > 1) {
      _cart.update(
          id,
          (item) => CartItem(
                id: id,
                title: item.title,
                price: item.price,
                quantity: item.quantity - 1,
                image: item.image,
              ));
    } else {
      _cart.remove(id);
    }
    notifyListeners();
  }
}
