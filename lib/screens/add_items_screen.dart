import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoping_list_app/providers/item_provider.dart';

class AddItemsScreen extends StatefulWidget {
  const AddItemsScreen({super.key});

  @override
  State<AddItemsScreen> createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitData() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Add Shopping Items',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Make card size to content
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Item Name',
                    hintText: 'Enter item name',
                    border: InputBorder.none,
                  ),
                ),
                const Divider(),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price (Optional)',
                    hintText: 'Enter price',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: (){
                    final title = _titleController.text;
                    final priceText = _priceController.text;

                    print('ADD ITEM: Title entered: $title');
                    print('ADD ITEM: Price entered: $priceText');

                    if (title.isEmpty) {
                    // Don't submit if the title is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Item title cannot be empty!')),
                    );
                    return;
                    }

                    // Use int.tryParse which returns null if parsing fails
                    final int? price = priceText.isEmpty ? null : int.tryParse(priceText);

                    print('ADD ITEM: Calling Provider.addItems with title: $title, price: $price');

                    // Use listen: false because we are calling a method, not rebuilding the UI
                    Provider.of<ItemProvider>(context, listen: false).addItems(title, price);

                    // Go back to the previous screen
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add Item'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
