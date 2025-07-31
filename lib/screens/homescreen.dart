import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_list_app/widgets/searchbar.dart';
import 'package:shoping_list_app/widgets/shoplist.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Earliest in delivery -',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 2),
            const Row(
              children: [
                Text(
                  '8 minutes',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(), // Use a Spacer for flexible space
                Icon(Icons.favorite, size: 32, color: Colors.white),
                SizedBox(width: 8),
                Icon(Icons.person, size: 32, color: Colors.white),
              ],
            )
          ],
        ),
      ),
      //Serch Bar and then Shoping list
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Searchbar(), // Corrected from SearchBar() to Searchbar()
            const SizedBox(height: 15,),
            // You can add your shopping list widgets below the search bar
            Shoplist(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
       ),
    );
  }
}
