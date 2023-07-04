import 'package:flutter/material.dart';

class CreatePlace extends StatefulWidget {
  const CreatePlace({super.key});

  @override
  State<CreatePlace> createState() => _CreatePlaceState();
}

class _CreatePlaceState extends State<CreatePlace> {
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
              decoration: const InputDecoration(label: Text("Name a place")),
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    print('print');
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
