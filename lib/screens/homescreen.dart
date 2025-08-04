import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_list_app/providers/item_provider.dart';
import 'package:shoping_list_app/screens/add_items_screen.dart';
import 'package:shoping_list_app/widgets/shoplist.dart';
import 'package:shoping_list_app/widgets/searchbar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    // Fetch initial data when the widget is first created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shopping List',
              style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<ItemProvider>(context, listen: false).fetchAndSetItems(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Searchbar(),
                  const SizedBox(height: 25,),
                  // The Shoplist widget will consume the provider and display the items
                  Expanded(child: Shoplist()),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemsScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}