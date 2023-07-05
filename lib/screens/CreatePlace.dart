import 'dart:io';

import 'package:favourite_places/store/PlaceProvider.dart';
import 'package:favourite_places/widgets/ImageInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CreatePlace extends ConsumerStatefulWidget {
  const CreatePlace({super.key});

  @override
  ConsumerState<CreatePlace> createState() => _CreatePlaceState();
}

class _CreatePlaceState extends ConsumerState<CreatePlace> {
  final _textController = TextEditingController();

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
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              ImageInput(image: _image, setImage: takeImage),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                  controller: _textController,
                  decoration:
                      const InputDecoration(label: Text("Name a place")),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground)),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        final text = _textController.text;
                        if (_image != null) {
                          ref
                              .read(placeProvider.notifier)
                              .addPlace(text, _image!);
                          Navigator.of(context).pop();
                        }
                      },
                      icon: const Icon(Icons.add_a_photo_outlined),
                      label: const Text(
                        "add",
                        style: TextStyle(fontSize: 24),
                      ))
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
