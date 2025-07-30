import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_list_app/widgets/searchbar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (contex, dynamic, child) {
        return Scaffold(
          backgroundColor: Colors.blueAccent,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                const Text('Earliest in delivery -',
                style: TextStyle(
                fontSize: 18,
                color: Colors.white
                ),
              ),
              SizedBox(height: 2,),
              Row(
                  children: [
                    Text('8 minutes',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),
                    SizedBox(
                      width: 195,
                      ),
                    Icon(Icons.favorite,
                    size: 32,
                    color: Colors.white),
                    SizedBox(width: 2,),
                    Icon(Icons.person,
                    size: 32,
                    color: Colors.white,)
                  ],
                )
             ]
            ), 
          ),
          //Serch Bar and then Shoping list 
          body: Container(
            margin: const EdgeInsets.all(15),
            child: const Column(
              children: [
                SearchBar(),
                // You can add your shopping list widgets below the search bar
              ],
            ),
          )
        );
      },
    );
  }
}
