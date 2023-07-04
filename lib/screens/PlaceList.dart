import 'package:favourite_places/screens/CreatePlace.dart';
import 'package:flutter/material.dart';

class PlaceList extends StatefulWidget {
  const PlaceList({super.key});

  @override
  State<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreatePlace() ));
          }, icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}