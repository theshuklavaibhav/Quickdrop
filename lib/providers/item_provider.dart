import 'package:provider/provider.dart';
import 'package:shoping_list_app/database/items_db.dart';
import 'package:shoping_list_app/models/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> _itemList = [];
  final ItemsDb itemsDb = ItemsDb();

  // void fetchInitialData() {
  //   _itemList = [
  //     Item(title: 'Mango', price: 60),
  //     Item(title: 'Banana', price: 12),
  //   ];
  // }

  Future<void> _loadItems() async {
    _itemList = await itemsDb.getItems();
  }

  ItemProvider() {
    _loadItems();
    notifyListeners();
  }

  //------------------Making Events to perform operation------------------------
  //---------------------get Shoping Items--------------------------------------
  List<Item> get getItems => _itemList;

  //-------------------Add Items in the List-----------------------------------
  Future<void> addItems(String title, int? price) async {
    print('PROVIDER: addItems called with title: $title, price: $price');
    final newItem = Item(title: title, price: price);
    print('PROVIDER: Inserting item into database...');
    await itemsDb.insertItems(newItem);
    await _loadItems();
    notifyListeners();
  }

  Future<void> fetchAndSetItems() async {
    _itemList = await itemsDb.getItems();
    notifyListeners();
  }

  //------------------------Delete Item-----------------------------------------
  Future<void> deleteItem(int id) async {
    await itemsDb.deleteItem(id);
    await _loadItems();
    notifyListeners();
  }

  //-------------------------Updating Item--------------------------------------
  Future<void> updateItem(Item item) async {
    await itemsDb.updateItem(item);
    await _loadItems();
    notifyListeners();
  }
}
