import 'package:flutter/foundation.dart';
import 'package:shoping_list_app/database/items_db.dart';
import 'package:shoping_list_app/models/items.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> _itemList = [];
  List<Item> _filteredItems = []; // To hold the filtered list
  final ItemsDb itemsDb = ItemsDb();

  ItemProvider() {
    fetchAndSetItems();
  }

  // The getter now returns the filtered list
  List<Item> get getItems => _filteredItems;

  // Method to filter items based on a search query
  void filterItems(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all items
      _filteredItems = List.from(_itemList);
    } else {
      // Otherwise, filter the list
      _filteredItems = _itemList
          .where((item) =>
              item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    // Notify listeners to rebuild the UI
    notifyListeners();
  }

  Future<void> addItems(String title, int? price) async {
    final newItem = Item(title: title, price: price);
    await itemsDb.insertItems(newItem);
    // After adding, refresh the main list and filter again
    await fetchAndSetItems();
  }

  Future<void> fetchAndSetItems() async {
    _itemList = await itemsDb.getItems();
    // Initially, the filtered list is the same as the full list
    _filteredItems = List.from(_itemList);
    notifyListeners();
  }

  Future<void> deleteItem(int id) async {
    await itemsDb.deleteItem(id);
    // After deleting, refresh the main list and filter again
    await fetchAndSetItems();
  }

  Future<void> updateItem(Item item) async {
    await itemsDb.updateItem(item);
    // After updating, refresh the main list and filter again
    await fetchAndSetItems();
  }
}