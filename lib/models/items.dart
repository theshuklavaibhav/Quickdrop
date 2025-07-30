import 'package:flutter/widgets.dart';

class Items {
  // DateTime dateTime;
  List<String> itemList = [
    'Item01'
        'Item02'
        'Item03'
        'Item04'
        'Item05'
        'Item06',
  ];
  // Items(this.itemList);
  getItemList() {
    return itemList;
  }
  final List<String> history = ['Item01', 'Item06'];
  historyItems() {

    return history;
  }
    List<String> _getSuggestions(String query) {
    if (query.isEmpty) {
      return history;
    }
    return itemList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
