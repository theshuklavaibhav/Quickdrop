import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_list_app/providers/item_provider.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final SearchController _controller = SearchController();

  @override
  Widget build(BuildContext context) {
    // Get the provider, but don't listen for changes here
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);

    return SearchBar(
      controller: _controller,
      hintText: 'Search Items...',
      leading: const Icon(Icons.search),
      onChanged: (query) {
        // When the text changes, call the filter method
        itemProvider.filterItems(query);
      },
    );
  }
}
