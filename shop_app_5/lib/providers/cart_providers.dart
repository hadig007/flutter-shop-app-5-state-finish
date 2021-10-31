import 'package:flutter/cupertino.dart';
import 'package:shop_app_5/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _items = {};

  Map<String, CartModel> get items {
    return {..._items};
  }

  int get itemCount {
    print(_items.length);
    return _items.length;
  }
  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addToCart(String prodId, double price, String title) {
    if (_items.containsKey(prodId)) {
      _items.update(
        prodId,
        (value) => CartModel(
            id: value.id,
            title: value.title,
            quantity: value.quantity + 1,
            price: value.price),
      );
    } else {
      _items.putIfAbsent(
        prodId,
        () => CartModel(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }

  void removeCart(String prodId){
    _items.remove(prodId);
    notifyListeners();
  }
  void clear(){
    _items = {};
    notifyListeners();
  }
}
