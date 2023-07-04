import 'package:favourite_places/models/Place.dart';
import 'package:favourite_places/screens/CreatePlace.dart';
import 'package:flutter/material.dart';

class PlaceList extends StatefulWidget {
  const PlaceList({super.key});

  @override
  State<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {

  List<Place> _places=[
    Place(id: '1', title: "hello world"),
    Place(id: '2', title: "hello world")
  ];
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
      body: ListView.builder(
        itemCount: _places.length,
        itemBuilder:  (context, index) => ListTile(
          leading:Text(_places[index].title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 20
          ),),
        ),

      ),
    );
  }
}