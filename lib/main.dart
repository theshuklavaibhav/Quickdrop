import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import './screens/homescreen.dart';
import './providers/item_provider.dart';

void main() {
  runApp(MyApp());
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
        primaryColor:  Colors.white
      ),
      home: ChangeNotifierProvider(
        create: (context)=> ItemProvider(),
        child: Homescreen(), 
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SearchAnchor Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         useMaterial3: true,
//         // colorSchemeSeed: Colors.teal,
//       ),
//       home: const SearchAnchorScreen(),
//     );
//   }
// }

// class SearchAnchorScreen extends StatefulWidget {
//   const SearchAnchorScreen({super.key});

//   @override
//   State<SearchAnchorScreen> createState() => _SearchAnchorScreenState();
// }

// class _SearchAnchorScreenState extends State<SearchAnchorScreen> {
//   final List<String> _history = ['apple', 'banana'];
//   final List<String> _data = [
//     'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry',
//     'Fig', 'Grape', 'Honeydew', 'Kiwi', 'Lemon'
//   ];

//   List<String> _getSuggestions(String query) {
//     if (query.isEmpty) {
//       return _history;
//     }
//     return _data
//         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Modern Search (SearchAnchor)'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           // This is the main SearchAnchor widget
//           child: SearchAnchor(
//             // Builder for the search bar (when it's closed)
//             builder: (BuildContext context, SearchController controller) {
//               return SearchBar(
//                 controller: controller,
//                 padding: const MaterialStatePropertyAll<EdgeInsets>(
//                     EdgeInsets.symmetric(horizontal: 16.0)),
//                 onTap: () => controller.openView(),
//                 onChanged: (_) => controller.openView(),
//                 leading: const Icon(Icons.search),
//                 hintText: 'Search for a fruit...',
//               );
//             },
//             // Builder for the suggestions (when the search view is open)
//             suggestionsBuilder:
//                 (BuildContext context, SearchController controller) {
//               final suggestions = _getSuggestions(controller.text);
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
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }