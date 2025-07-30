import 'package:flutter/material.dart';
import 'package:shoping_list_app/models/items.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final items = Items();
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      viewHintText: 'Search Items...',
      viewLeading: const Icon(Icons.shop),
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          leading: const Icon(Icons.shop),
          hintText: 'Search Items...',
          onTap: () => controller.openView(),
          onChanged: (value) => controller.openView(),
          // trailing: Icon(Icons.search_sharp),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        final suggestions = items.getItemList();
        return suggestions.map((item) {
          return ListTile(
            title: Text(item),
            onTap: () {
              controller.closeView(item);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You Selected this $item ')),
              );
            },
          );
        });
        //               return suggestions.map((item) {
        //                 return ListTile(
        //                   title: Text(item),
        //                   onTap: () {
        //                     // Set the search bar text and close the view
        //                     controller.closeView(item);
        //                     // You might want to navigate to a results page here
        //                     ScaffoldMessenger.of(context).showSnackBar(
        //                       SnackBar(content: Text('You selected: $item')),
        //                     );
        //                   },
        //                 );
      },
    );
  }
}
