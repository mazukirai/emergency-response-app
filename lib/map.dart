import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for launching URLs

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Location',
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? _currentPosition;
  Placemark? _currentPlacemark;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    _currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _getAddressFromLatLng();
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );
      _currentPlacemark = placemarks.first;
      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  void _launchGoogleMaps() async {
    if (_currentPosition != null) {
      try {
        final url = 'https://www.google.com/maps?q=${_currentPosition!.latitude},${_currentPosition!.longitude}';
        // if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        //} else {
          //ScaffoldMessenger.of(context).showSnackBar(
            //const SnackBar(
              //content: Text('Could not launch Google Maps'),
            //),
          //);
        //}
      } catch (error) {
        print(error);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occurred while launching maps'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location permission denied or unavailable'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentPosition != null)
              Text(
                'Coordinates: ${_currentPosition!.latitude}, ${_currentPosition!.longitude}',
              ),
            if (_currentPlacemark != null)
              Text(
                'Address:${_currentPlacemark!.street}, ${_currentPlacemark!.subLocality}, ${_currentPlacemark!.locality}, ${_currentPlacemark!.country}',
              ),
            ElevatedButton(
              onPressed: _launchGoogleMaps,
              child: const Text('Show in Google Maps'),
            ),
          ],
        ),
      ),
    );
  }
}
