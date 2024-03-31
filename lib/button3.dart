import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Map<String, dynamic>> emergencyHotlines = [
  {
    "name": "Example 3 Station",
    "latitude": 14.565,
    "longitude": 121.072,
    "phoneNumbers": ["09123456789", "09876543210"], // List of phone numbers
  },
  // Add more hotlines with multiple numbers here
];

double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  final double distance = Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  return distance;
}

Future<Map<String, dynamic>> findNearestHotline() async {
  Position userLocation = await getUserLocation();
  Map<String, dynamic>? nearestHotline;
  double nearestDistance = double.infinity;

  for (final hotline in emergencyHotlines) {
    final double distance = calculateDistance(
        userLocation.latitude, userLocation.longitude, hotline['latitude'], hotline['longitude']);
    if (distance < nearestDistance) {
      nearestDistance = distance;
      nearestHotline = hotline;
    }
  }

  return Future.value(nearestHotline);
}

class ButtonThreeScreen extends StatefulWidget {
  @override
  _ButtonThreeScreenState createState() => _ButtonThreeScreenState();
}

class _ButtonThreeScreenState extends State<ButtonThreeScreen> {
  Map<String, dynamic>? _nearestHotline;
  late String _selectedPhoneNumber;

  @override
  void initState() {
    super.initState();
    _findNearestHotline();
  }

  Future<void> _findNearestHotline() async {
    final nearestHotline = await findNearestHotline();
    setState(() {
      _nearestHotline = nearestHotline;
      _selectedPhoneNumber =
          _nearestHotline?['phoneNumbers']?.first ?? ""; // Default to first number
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearest Hotline (Flood)'),
      ),
      body: _nearestHotline != null
          ? _buildHotlineDetails()
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildHotlineDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Nearest Emergency Hotline:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              SizedBox(width: 5),
              Text(_nearestHotline!['name'] ?? "Unavailable"),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Phone Numbers:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: _selectedPhoneNumber,
            onChanged: (phoneNumber) {
              setState(() {
                _selectedPhoneNumber = phoneNumber!;
              });
            },
            items: _nearestHotline!['phoneNumbers']!
                .map<DropdownMenuItem<String>>((phoneNumber) {
              return DropdownMenuItem<String>(
                value: phoneNumber,
                child: Text(phoneNumber),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => launch("tel:$_selectedPhoneNumber;auto"),
            child: Text('Call Hotline'),
          ),
        ],
      ),
    );
  }
}

Future<Position> getUserLocation() async {
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  return position;
}
