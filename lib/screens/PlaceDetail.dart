import 'package:favourite_places/models/Place.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatefulWidget {
  const PlaceDetail({super.key,required this.place});

  final Place place;

  @override
  State<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends State<PlaceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.place.title),
      ),
      body: Center(
        child: Column(children:[ Container(
          width: double.infinity,
          height: 250,
          child: Image.file(widget.place.image,fit: BoxFit.cover,),
        ),Text(widget.place.title)]),
      ),
    );
  }
}