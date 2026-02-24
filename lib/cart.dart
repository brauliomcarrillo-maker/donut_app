import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  static final Cart _instance = Cart._internal();

  factory Cart() {
    return _instance;
  }

  Cart._internal();

  final List<List<dynamic>> _items = [];

  List<List<dynamic>> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += double.parse(item[1]);
    }
    return total;
  }

  void addItem(List<dynamic> item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
