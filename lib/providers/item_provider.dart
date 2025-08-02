import 'package:provider/provider.dart';
import 'package:shoping_list_app/models/items.dart';
import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  List<Items> _itemList = [];

  void fetchInitialData() {
    _itemList = [
      // Items(title: 'Mango', price: 60),
      // Items(title: 'Banana', price: 12),
    ];
  }

  //------------------Making Events to perform operation------------------------
  //---------------------get Shoping Items--------------------------------------
  List<Items> get getItems => _itemList;

  //-------------------Add Items in the List-----------------------------------
  void addItems(String title, int? price) { // Changed to int?
    final newItem = Items(title: title, price: price);
    _itemList.add(newItem);
    notifyListeners();
  }

  //------------------------Delete Item-----------------------------------------
  void deleteItem(int index) {
    _itemList.removeAt(index);
    notifyListeners();
  }
}
