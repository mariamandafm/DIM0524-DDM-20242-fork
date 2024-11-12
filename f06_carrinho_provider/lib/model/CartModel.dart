import 'package:f06_carrinho_provider/model/item.dart';
import 'package:flutter/material.dart';

class CartModel with ChangeNotifier{
  List<Item> _cartItems = [];

  List<Item> get cartItems => _cartItems;

  void addItem(Item item){
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(Item item){
    _cartItems.remove(item);
    notifyListeners();
  }

  bool hasItem(Item item){
    return _cartItems.contains(item);
  }
}