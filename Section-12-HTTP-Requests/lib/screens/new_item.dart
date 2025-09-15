import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sec11_handling_user_input/data/categories.dart';
import 'package:sec11_handling_user_input/models/category.dart';
// import 'package:sec11_handling_user_input/models/grocery_item.dart';
import 'package:http/http.dart' as http;
import 'package:sec11_handling_user_input/models/grocery_item.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({super.key});

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  var enterdName = '';
  var enterdAmount = 1;
  var selectedCatagory = categories[Categories.dairy];
  var c = categories;
  var _isSending = false;
  final _formkey = GlobalKey<FormState>();
  void _saveItem() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      final url = Uri.https('flutter-prep-fac74-default-rtdb.firebaseio.com',
          'shopping-list.json');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'name': enterdName,
            'quantity': enterdAmount,
            'category': selectedCatagory!.cantagoryName
          },
        ),
      );
      
      print(response.statusCode);
      print(response.body);
      if (!context.mounted) {
        return;
      }
      final Map<String, dynamic> responseBody = json.decode(response.body);
      Navigator.of(context).pop(GroceryItem(
          id: responseBody['name'],
          name: enterdName,
          quantity: enterdAmount,
          category: selectedCatagory!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                initialValue: enterdAmount.toString(),
                decoration: const InputDecoration(label: Text('Name')),
                maxLength: 50,
                onSaved: (value) {
                  enterdName = value!;
                },
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.length >= 50) {
                    return 'error message';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: '1',
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      onSaved: (value) {
                        enterdAmount = int.parse(value!);
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! < 0) {
                          return 'input valid positive number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: selectedCatagory,
                      onChanged: (value) {
                        selectedCatagory = value;
                      },
                      items: [
                        for (final category in c.entries)
                          DropdownMenuItem(
                              value: category.value,
                              child: Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 12,
                                      width: 12,
                                      color: category.value.cantagoryColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(category.value.cantagoryName)
                                  ],
                                ),
                              ))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed:_isSending ? null: () {
                        _formkey.currentState!.reset();
                      },
                      child:  const Text('Reset')),
                  ElevatedButton(
                      onPressed: _isSending ? null : _saveItem,
                      child: _isSending
                          ? const SizedBox(
                              height: 12,
                              width: 12,
                              child: CircularProgressIndicator(),
                            )
                          :const Text('save'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
