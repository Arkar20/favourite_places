import 'package:favourite_places/store/PlaceProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePlace extends ConsumerStatefulWidget {
  const CreatePlace({super.key});

  @override
  ConsumerState<CreatePlace> createState() => _CreatePlaceState();
}

class _CreatePlaceState extends ConsumerState<CreatePlace> {

  final _textController=TextEditingController();

  @override
  void dispose(){
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
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(label: Text("Name a place")),
               style: TextStyle(
                color:Theme.of(context).colorScheme.onBackground
               )
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    final text=_textController.text;
                    ref.read(placeProvider.notifier).addPlace(text);
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.add_a_photo_outlined),
                  label: const Text(
                        "add",
                        style: TextStyle(fontSize: 24),
                      )
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
