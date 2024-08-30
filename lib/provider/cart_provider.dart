import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleProduct(Product product) {
    if (_cart.contains(product)) {
      _cart.remove(product);
    } else {
      _cart.add(product);
    }

    notifyListeners();
  }

  void incrementQuantity(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(int index) {
    if (index >= 0 && index < _cart.length) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity--;
        notifyListeners();
      }
    }
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
