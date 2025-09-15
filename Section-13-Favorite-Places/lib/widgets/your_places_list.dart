import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sec13/models/palce.dart';
import 'package:sec13/providers/list_provider.dart';
import 'package:sec13/widgets/place_item.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key, required this.placesList});
  final List<Place> placesList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onRemove(Place item) {
    ref.watch(availablePlaces.notifier).removePlace(item);
  }
    return ListView.builder(
      itemCount: placesList.length,
      itemBuilder: (cxt, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.5),
          margin: const EdgeInsets.all(5),
        ),
        onDismissed: (direction) {onRemove(placesList[index]);},
        key: ValueKey(placesList[index]),
        child: PlaceItem(place: 
          placesList[index], index: index,
        ),
      ),
    );
}
}