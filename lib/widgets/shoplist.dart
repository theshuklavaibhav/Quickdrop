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
            final item = data.getItems[id];
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  // Use a conditional (ternary) operator on the 'color'property
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  
                  color: item.isPurchased ? Colors.greenAccent: const Color.fromARGB(255, 255, 249, 133),
                ),
                child: ListTile(
                  leading: Checkbox(
                    value: item.isPurchased,
                    onChanged: (value) {
                      item.isPurchased = value ?? false;
                      data.updateItem(item);
                    },
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          // decoration: item.isPurchased
                          //     ? TextDecoration.lineThrough
                          //     : TextDecoration.none,
                        ),
                      ),
                      Text("Price - ${item.price.toString()}"),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      data.deleteItem(data.getItems[id].id!);
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
