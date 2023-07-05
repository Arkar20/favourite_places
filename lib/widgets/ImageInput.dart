import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.image, required this.setImage});

  final File? image;

  final Function() setImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
        onPressed: () {
          widget.setImage();
        },
        icon: const Icon(Icons.camera),
        label: const Text("Take Camera"));

    if (widget.image != null) {
      content = Image.file(widget.image!, fit: BoxFit.cover);
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
