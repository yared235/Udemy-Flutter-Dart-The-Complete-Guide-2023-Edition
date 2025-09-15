import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sec13/providers/list_provider.dart';
import 'package:sec13/widgets/input_image.dart';
import 'package:sec13/widgets/input_location.dart';

class AddNewPlace extends ConsumerWidget {
  AddNewPlace({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? placeTitle;
    File? pickedImage;
    void add() {
      try {
        if (pickedImage == null || placeTitle == null) {
          print(pickedImage==null);
          return ;
        } else {
          ref
              .read(availablePlaces.notifier)
              .addPlace(placeTitle!, pickedImage!);
        }
      } catch (e) {
        throw Exception(e);
      }
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'add place'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your place name';
                  }
                  // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  //   return 'Enter a valid email';
                  // }
                  return null;
                },
                onSaved: (value) {
                  placeTitle = value;
                },
              ),
              const SizedBox(height: 16),
              InputImage(
                selectImage: (image) {
                  pickedImage=image;
                },
              ),
              const SizedBox(height: 16),
              const InputLocation(),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // print('Saved Email: ');

                    add();
                  }
                },
                child: const Text('Add'),
              ),
              // SizedBox(height: 8),
              // ElevatedButton(
              //   onPressed: () {
              //     _formKey.currentState!.reset();
              //   },
              //   child: Text('Reset'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}



// class FormExample extends StatelessWidget {
  
//   String? _email;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Form Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
//                     return 'Enter a valid email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value;
//                 },
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     print('Saved Email: $_email');
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//               SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: () {
//                   _formKey.currentState!.reset();
//                 },
//                 child: Text('Reset'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
