import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class InputLocation extends StatefulWidget {
  const InputLocation({super.key});

  @override
  State<InputLocation> createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {
  var lat;
  Double? log;
  bool isLocationLoading = false;
  void _getCurrentLocation() async {
    
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      isLocationLoading = true;
    });
    locationData = await location.getLocation();
    setState(() {
      lat=locationData.latitude;
    log!= locationData.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget locationWidget = const Text('Location not selected');
    if (isLocationLoading == true) {
      locationWidget = const CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.5),
          margin: const EdgeInsets.all(5),
          child: Text('latitude: $lat longtuide: $log'),
        ),
        Row(
          children: [
            TextButton.icon(
              label: const Text('Get your location'),
              icon: const Icon(Icons.location_on),
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              label: const Text('get on map'),
              icon: const Icon(Icons.location_on),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
