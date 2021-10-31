import 'package:flutter/cupertino.dart';
import 'package:shop_app_5/models/cart_model.dart';
import 'package:shop_app_5/models/order_model.dart';

class OrderProviders with ChangeNotifier {
  List<OrderModel> _items = [];

  List<OrderModel> get items {
    return [..._items];
  }

  void addOrders(List<CartModel> cart, double total) {
    _items.insert(
      0,
      OrderModel(
          id: DateTime.now().toString(),
          dateTime: DateTime.now(),
          amount: total,
          products: cart),
    );
  }
}
