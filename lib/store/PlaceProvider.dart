import 'dart:io';

import 'package:favourite_places/models/Place.dart';
import 'package:riverpod/riverpod.dart';


class PlaceNotifier extends StateNotifier<List<Place>> {

  PlaceNotifier() :super([]);

  void addPlace(String title,File image){
    final place= Place(id: (state.length+1).toString(), title: title,image:image);

    state=[
      ...state,
      place
    ];
  }
}

final placeProvider= StateNotifierProvider<PlaceNotifier,List<Place>>((ref)=>PlaceNotifier());