import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _image;

  void takeImage() async {
// ImagePicker.pickImage();
    final picker = ImagePicker();
    final image = await picker.pickImage(
        source: ImageSource.camera, maxWidth: double.infinity);

    if (image == null) {
      return;
    }

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget content= TextButton.icon(
        onPressed: () {
          takeImage();
        },
        icon: const Icon(Icons.camera),
        label: const Text("Take Camera"));

        if(_image!=null){
          content= Image.file(_image!,fit:BoxFit.cover);
        }
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
      height: 200,
      width: double.infinity,
      child: content,
    );
  }

 
}
