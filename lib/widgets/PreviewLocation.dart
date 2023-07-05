import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PreviewLocation extends StatelessWidget {
  const PreviewLocation({super.key,required this.loading,required this.location});

  final bool loading;
  final Position? location;
  @override
  Widget build(BuildContext context) {

     Widget content= Center(
        child: Text("No Location Found!",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground
          ),
        ),
      );

      if(loading){
        content=  const Center(child: CircularProgressIndicator());
      }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
        ),
      ),
      width: double.infinity,
      height: 150,
      child:  content,
    );
  }
}