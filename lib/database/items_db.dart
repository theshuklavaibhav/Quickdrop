import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shoping_list_app/models/items.dart';

class ItemsDb {
  //----------------Making Instaance of DB--------------------------------------
  static final ItemsDb _instance = ItemsDb._internal();
  factory ItemsDb() => _instance;
  ItemsDb._internal();
  static Database? _database;

  //-----------------Making Events to perform operations------------------------
  //-----------------Event 01: Get Database-------------------------------------
  Future<Database> get getDatabase async {
    if (_database == null) {
      _database = await initDB();
      return _database!;
    } else {
      return _database!;
    }
  }

  //------------------Event 02: Initialize Database-----------------------------
  Future<Database> initDB() async {
    print('DATABASE: Initializing database...');
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Items.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        print('DATABASE: Creating table...');
        await db.execute('''CREATE TABLE Items(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          itemName TEXT NOT NULL,
          Price INTEGER,
          isDone INTEGER NOT NULL
          )''');
        print('DATABASE: Table created.');
      },
    );
  }

  //-------------------Event 03 Add Items---------------------------------------
  Future<int> insertItems(Item item) async {
    print('DATABASE: Inserting item: ${item.toMap()}');
    final db = await _database!;
    final result = await db.insert(
      'Items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('DATABASE: Insert result: $result');
    return result;
    return result;
  }

  //-------------------Event 04- Delete Item------------------------------------
  Future<int> deleteItem(int id) async {
    final db = await getDatabase;
    return db.delete('Items', where: 'id = ?', whereArgs: [id]);
  }

  //-------------------Event 05 Get Database------------------------------------
  Future<List<Item>> getItems() async {
    print('DATABASE: Getting all items...');
    final db = await getDatabase;
    final List<Map<String, dynamic>> maps = await db.query('Items');
    print('DATABASE: Found ${maps.length} items in the database.');
    if (maps.isEmpty) {
      print('DATABASE: No items found. Database might be empty.');
    }
    return List.generate(maps.length, (i) {
      return Item.fromMap(maps[i]);
    });
  }

  Future<int> updateItem(Item item) async {
    final db = await _database!;
    return db.update(
      'Items',
      item.toMap(),
      where: 'id=?',
      whereArgs: [item.id]);
  }

  // Future<List<Item>> getItems() async {
  //   final db = await getDatabase;
  //   final List<Map<String, dynamic>> maps = await db.query('Items');
  //   return List.generate(maps.length, (i) {
  //     return Item.fromMap(maps[i]);
  //   });
  // }
}
