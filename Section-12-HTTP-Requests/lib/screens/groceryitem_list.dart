import 'package:flutter/material.dart';
import 'package:sec11_handling_user_input/data/categories.dart';
import 'package:sec11_handling_user_input/models/grocery_item.dart';
import 'package:sec11_handling_user_input/screens/new_item.dart';
import 'package:sec11_handling_user_input/widgets/grocery_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class GroceryItemList extends StatefulWidget {
  const GroceryItemList({super.key});

  @override
  State<GroceryItemList> createState() => _GroceryItemListState();
}

class _GroceryItemListState extends State<GroceryItemList> {
  var _isLoading = true;
  String? _error;
  List<GroceryItem> groceryItems = [];
  @override
  void initState() {
    super.initState();
    _loadItems();
    //_isLoading = false;
  }

  void _loadItems() async {
    final url = Uri.https(
        'lutter-prep-fac74-default-rtdb.firebaseio.com', 'shopping-list.json');
    try {
    final response = await http.get(url);
    if(response.body == 'null') {
      setState(() {
        _isLoading=false;
      });
      return ;
    }
    if(response.statusCode>400) {
      setState(() {
        _error='couldn\'t leod form server try again later';
      });
    }
    print(response);
    print(response.body);
    Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere((catItem) =>
              catItem.value.cantagoryName == item.value['category'])
          .value;
      loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }
    setState(() {
      groceryItems = loadedItems;
     _isLoading = false;
    });
    }catch(error) {
      setState(() {
        _isLoading = false;
        _error='some thing went wrong';
      });
    }
    
  }

  void addNewItem() async {
    /* waiting the user to comeback?*/
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (cxt) => const AddNewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      groceryItems.add(newItem);
    });
    // _loadItems();
  }
  // setState(( {
  //     groceryItems = _loadedItems;
  //     //groceryItemsCopy.add([]/*GroceryItem(id: response[id], name: response[], quantity: quantity, category: category)*/);
  //   }));

  void dismiss(GroceryItem item) async{
    final index=groceryItems.indexOf(item);
    setState(() {
      groceryItems.remove(item);
    });
    final url = Uri.https(
        'flutter-prep-fac74-default-rtdb.firebaseio.com', 'shopping-list/${item.id}.json');
     final response= await http.delete(url);
    if(response.statusCode >= 400) {
      setState(() {
        groceryItems.insert(index,item);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if(_error != null) {
      content= Center(child: Text(_error!),);
    }
    else if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }
    else if (groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (cxt, index) => Dismissible(
          onDismissed: (direction) {
            dismiss(groceryItems[index]);
          },
          key: ValueKey(groceryItems[index].id),
          child: GroceryItemDisplay(
            groceryItem: groceryItems[index],
          ),
        ),
      );
    } else {
      content = const Center(
          child: Text('There are on groceries to display, add some'));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(onPressed: addNewItem, icon: const Icon(Icons.add))
          ],
        ),
        body: content

        /*Column(
        children: [
          ...groceryItemsCopy.map(
            (e) => GroceryItemDisplay(
              groceryItem: e,
            ),
          )
        ],
      ), */
        );
  }
}
