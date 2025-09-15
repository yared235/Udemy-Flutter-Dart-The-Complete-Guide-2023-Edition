import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sec13/providers/list_provider.dart';
import 'package:sec13/screens/add_place.dart';
import 'package:sec13/widgets/your_places_list.dart';

class MyPlaces extends ConsumerStatefulWidget {
  const MyPlaces({super.key});

  @override
  ConsumerState<MyPlaces> createState() => _MyPlacesState();
}

class _MyPlacesState extends ConsumerState<MyPlaces> {
  late Future<void>? placesFuture;// had error
  @override
  void initState() {
    super.initState();
    placesFuture= ref.read(availablePlaces.notifier).leadDatabase();
  }
  void addPlace() {
    Navigator.of(context).push(MaterialPageRoute(builder: (cxt) =>  AddNewPlace()));
  }
  @override
  Widget build(BuildContext context) {
    var placesList=ref.watch(availablePlaces);
    return Scaffold(
      appBar: AppBar(actions: [
      IconButton(onPressed: addPlace, icon: const Icon(Icons.add))
      ], title: const Text('Your Places'),),
      body: FutureBuilder(future: placesFuture, builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting ? const Center(child:  CircularProgressIndicator() ):  PlacesList(placesList: placesList,),)
    );
    
  }
}