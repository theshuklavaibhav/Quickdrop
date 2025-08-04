import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import './screens/homescreen.dart';
import './providers/item_provider.dart';
import 'package:sqflite/sqflite.dart';

void printDbPath() async {
  var databasesPath = await getDatabasesPath();
  String path = '$databasesPath/Items.db';
  print('Database Path: $path');
}
void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>ItemProvider(),
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'An Shopping List App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        searchBarTheme: const SearchBarThemeData(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          elevation: MaterialStatePropertyAll(1.0),
          hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black54)),
          textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black)),
        )
      ),
      home: const Homescreen()
    );
  }
}

