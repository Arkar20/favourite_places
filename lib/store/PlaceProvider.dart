import 'package:favourite_places/models/Place.dart';
import 'package:riverpod/riverpod.dart';


class PlaceNotifier extends StateNotifier<List<Place>> {

  PlaceNotifier() :super([]);

  void addPlace(String title){
    final place= Place(id: (state.length+1).toString(), title: title);

    state=[
      ...state,
      place
    ];
  }
}

final placeProvider= StateNotifierProvider<PlaceNotifier,List<Place>>((ref)=>PlaceNotifier());