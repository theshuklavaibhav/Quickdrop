import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_list_app/models/items.dart';
import 'package:shoping_list_app/providers/item_provider.dart';

class Shoplist extends StatelessWidget {
  const Shoplist({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, data, child) {
        return ListView.builder(
          itemCount: data.getItems.length,
          itemBuilder: (context, id) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.check_box),
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.getItems[id].title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                       ),
                      ),
                      Text("Price - ${data.getItems[id].price.toString()}")
                    ]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    data.deleteItem(data.getItems[id].id!);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
