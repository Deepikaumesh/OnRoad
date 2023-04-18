import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class geo_location extends StatefulWidget {
  const geo_location({Key? key}) : super(key: key);

  @override
  _geo_locationState createState() => _geo_locationState();
}

class _geo_locationState extends State<geo_location> {
  String location = 'null press button';
  String Address = 'search';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddressFromLatiLongi(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place = placemark[0];
    Address =
        '${place.name},${place.administrativeArea},${place.locality},${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("coordinate points"),
            SizedBox(
              height: 10,
            ),
            Text('$location'),
            SizedBox(
              height: 10,
            ),
            Text("address"),
            Text('${Address}'),
            ElevatedButton(
                onPressed: () async {
                  Position position = await _determinePosition();
                  print(position.latitude);
                  print(position.longitude);
                  location = 'Lat${position.latitude},Log${position.longitude}';
                  GetAddressFromLatiLongi(position);
                  setState(() {});
                },
                child: Text("get location")),
          ],
        ),
      ),
    );
  }
}
