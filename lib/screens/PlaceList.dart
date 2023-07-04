import 'package:favourite_places/screens/CreatePlace.dart';
import 'package:favourite_places/store/PlaceProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceList extends ConsumerStatefulWidget {
  const PlaceList({super.key});

  @override
  ConsumerState<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends ConsumerState<PlaceList> {

  @override
  Widget build(BuildContext context) {

    final _places=ref.watch(placeProvider);
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