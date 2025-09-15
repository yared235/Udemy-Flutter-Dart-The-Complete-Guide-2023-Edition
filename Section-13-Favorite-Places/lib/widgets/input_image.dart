import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatefulWidget {
  const InputImage({super.key, required this.selectImage});
  final void Function(File image) selectImage;
  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  
  File? selectedImage;
  void _takeImage() async {
    var imagepicker = ImagePicker();
    final pickedImage =
        await imagepicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      selectedImage = File(pickedImage.path);
    });
    widget.selectImage(selectedImage!);

  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      label: const Text('Take a picture'),
      onPressed: _takeImage,
      icon: const Icon(Icons.camera),
    );
    if (selectedImage != null) {
      content = GestureDetector(
        onTap: _takeImage,
        child: Image.file(
          selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return SizedBox(width: double.infinity, height: 100, child: content);
  }
}
