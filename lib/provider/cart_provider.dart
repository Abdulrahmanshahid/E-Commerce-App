import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  // Toggle product in the cart
  void toggleProduct(Product product) {
    if (_cart.contains(product)) {
      _cart.remove(product);
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  // Increment product quantity
  void incrementQuantity(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart[index].quantity++;
      notifyListeners();
    }
  }

  // Decrement product quantity
  void decrementQuantity(int index) {
    if (index >= 0 && index < _cart.length) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity--;
        notifyListeners();
      }
    }
  }

  // Remove product from the cart
  void removeProduct(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  // Calculate total price of items in the cart
  double get totalPrice {
    double total = 0.0;
    for (var product in _cart) {
      total += product.price * product.quantity;
    }
    return total;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
