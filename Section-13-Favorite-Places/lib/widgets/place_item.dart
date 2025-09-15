import 'package:flutter/material.dart';
import 'package:sec13/models/palce.dart';
import 'package:sec13/screens/places_detail.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({super.key,required this.place, required this.index});
  final Place place;
  final int index;

  @override
  Widget build(BuildContext context) {
    void showDetailsScreen(Place place) {
      Navigator.of(context).push(MaterialPageRoute(builder: (cxt)=> PlaceDetail(place: place,)));
    }
    return 
    ListTile(leading: CircleAvatar(radius: 26,backgroundImage: FileImage(place.image),),onTap: (){showDetailsScreen(place);},title: Text(place.title),)
    
    ;
  }
}