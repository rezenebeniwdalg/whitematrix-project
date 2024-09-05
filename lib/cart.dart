// models/cart.dart


import 'package:whitematrix/model.dart';

class Cart {
  List<Product> items = [];

  void addProduct(Product product) {
    items.add(product);
  }

  void removeProduct(Product product) {
    items.remove(product);
  }

  double get totalPrice {
    return items.fold(0, (sum, item) => sum + item.price);
  }
}
