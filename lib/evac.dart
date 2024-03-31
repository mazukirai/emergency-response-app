import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';



final List<Map<String, dynamic>> evacuationCenters = [
{
    "name": "Brgy.Bagong Ilog Elementary School",
    "latitude": 14.563889,
    "longitude": 121.071111,
    "address": "Bagong Ilog Elementary School 52 A Flores, Bagong Ilog, Pasig City, Metro Manila",
    "coordinates": "14.563889, 121.071111"
  },
  {
    "name": "Barangay Bagong Katipunan Covered Court",
    "latitude": 14.558611,
    "longitude": 121.074444,
    "address": "Bagong Katipunan Covered Court, Bagong Katipunan, Pasig City, Metro Manila",
  },
  {
    "name": "Villa Alfonso Gym Evacuation Center",
    "latitude": 14.554167,
    "longitude": 121.084722,
    "address": "Villa Alfonso Gym, Bambang, Pasig City, Metro Manila"
  },
  {
    "name": "Buting Covered Court",
    "latitude": 14.553056,
    "longitude": 121.068889,
    "address": "Buting Covered Court, Buting, Pasig City, Metro Manila"
  },
  {
    "name": "Kalinangan Covered Court",
    "latitude": 14.572222,
    "longitude": 121.078889,
    "address": "Kalinangan Covered Court, Caniogan, Pasig City, Metro Manila"
  },
  {
    "name": "Dela Paz Barangay Hall",
    "latitude": 14.6135,
    "longitude": 121.09574,
    "address": "J37W+689, F. Mariano Ave., Comfrey Ln, Pasig, Metro Manila"
  },
  {
    "name": "Kalawaan Barangay Hall",
    "latitude": 14.55159,
    "longitude": 121.08664,
    "address": "132 Sixto Cuevas Ave, Pasig, 1600 Metro Manila"
  },
  {
    "name": "Kalawaan Health Center",
    "latitude": 14.55153,
    "longitude": 121.08681,
    "address": "H32P+JHQ, P.Visitacion, Pasig, Metro Manila"
  },
  {
    "name": "Kapasigan Barangay Hall",
    "latitude": 14.56459,
    "longitude": 121.07424,
    "address": "H37F+RPJ, A. Mabini Street, Barangay Kapasigan, Pasig City, 1600 Metro Manila"
  },
  {
    "name": "Kapasigan Covered Court",
    "latitude": 14.5646 ,
    "longitude": 121.07404,
    "address": "1600 Dr. Pilapil St., Kapasigan, Pasig, 1600 Metro Manila"
  },
  {
    "name": "Kapasigan Health Center",
    "latitude": 14.56459 ,
    "longitude": 121.07424,
    "address": "H37F+RPJ, Industria, Pasig, Metro Manila"
  },
  {
    "name": "Kapitolyo Barangay Hall",
    "latitude": 14.57142,
    "longitude": 121.0593,
    "address": "H3C5+HPW, Santa Isabela St, Pasig, Metro Manila"
  },
  {
    "name": "Kapitolyo Health Center",
    "latitude": 14.5715,
    "longitude": 121.059694,
    "address": "Santa Isabela, Pasig, Metro Manila"
  },
  {
    "name": "Malinao Barangay Hall",
    "latitude": 14.55806,
    "longitude": 121.07609,
    "address": "33 Int. E Jacinto Street, Malinao, Pasig City, 1600 Metro Manila"
  },
  {
    "name": "Alfonso Evacuation Center",
    "latitude": 14.5554,
    "longitude": 121.0801,
    "address": "H34J+528, Pasig, Metro Manila"
  },
  {
    "name": "Manggahan Multipurpose Hall",
    "latitude": 14.59836,
    "longitude": 121.09163,
    "address": "Manggahan Brgy Hall, East Bang Road, Pasig, 1611 Metro Manila"
  },
  {
    "name": "Maybunga Elementary School Annex",
    "latitude": 14.5780,
    "longitude": 121.0965,
    "address": "Westbank Road floodway, Maybunga, Pasig City "
  },
  {
    "name": "Stella Maris Covered Court",
    "latitude": 14.57743,
    "longitude": 121.08196,
    "address": "Blue Street, Stella Mariz, Maybunga, Pasig City"
  },
  {
    "name": "Palatiw Covered Court",
    "latitude": 14.56276,
    "longitude": 121.08385,
    "address": "Palatiw Covered Court  Market Ave, Pasig City"
  },
  {
    "name": "Nagpayong Multipurpose Hall",
    "latitude": 14.5444100,
    "longitude": 121.1045950,
    "address": "8727, 1602 Sandoval Ave,Pasig City"
  },
  {
    "name": "Nagpayong Multipurpose Hall",
    "latitude": 14.5444100,
    "longitude": 121.1045950,
    "address": "8727, 1602 Sandoval Ave,Pasig City"
  },
  {
    "name": "Pineda Barangay Hall",
    "latitude": 14.56522583157977,
    "longitude": 121.06130815075987,
    "address": "115 F. Banaag Street, Pineda, Pasig City, Metro Manila"
  },
  {
    "name": "Pineda Elementary School",
    "latitude": 14.5650756,
    "longitude": 121.0614360,
    "address": "Banaag Street, Pineda, Pasig City, Metro Manila"
  },
  {
    "name": "Barangay Pineda Basketball Court Purok 2",
    "latitude": 14.562622736670377,
    "longitude": 121.0626049333938,
    "address": "633 MRR Street, Pineda, Pasig City, Metro Manila"
  },
  {
    "name": "Pineda Multipurpose Hall",
    "latitude": 14.562622736670377,
    "longitude": 121.0626049333938,
    "address": "412 MRR Street, Pineda, Pasig City, Metro Manila"
  },
  {
    "name": "Rosario Barangay Hall",
    "latitude": 14.586127104766657,
    "longitude": 121.08470952731983,
    "address": "Bernal Street, Rosario, Pasig City, Metro Manila"
  },
  {
    "name": "Rosario Elementary School",
    "latitude": 14.5852188,
    "longitude": 121.0844596,
    "address": "40 B Dr. Sixto Antonio Avenue, Rosario, Pasig City, Metro Manila"
  },
  {
    "name": "Sagad Elementary School",
    "latitude": 14.5662413,
    "longitude": 121.0796001,
    "address": "Jose Feliciano Ext., Sagad, Pasig City, Metro Manila"
  },
  {
    "name": "Sagad Barangay Hall",
    "latitude": 14.58728073912726,
    "longitude": 121.0843919851207,
    "address": "52 Jose Feliciano Ext., Sagad, Pasig City, Metro Manila"
  },
  {
    "name": "San Antonio Barangay Hall",
    "latitude": 14.581241038349747,
    "longitude": 121.06116593697266,
    "address": "7 Gen. Malvar Street, San Antonio Village, San Antonio, Pasig City, Metro Manila"
  },
  {
    "name": "San Joaquin Barangay Hall",
    "latitude": 14.55244777019768,
    "longitude": 121.07954946074437,
    "address": "514 AR Hernandez, San Joaquin, Pasig City, Metro Manila"
  },
  {
    "name": "San Joaquin Elementary School",
    "latitude": 14.5512492,
    "longitude": 121.0758637,
    "address": "1601 Elizco Rd, San Joaquin, Pasig City, Metro Manila"
  },
  {
    "name": "San Jose Barangay Hall",
    "latitude": 14.56134 ,
    "longitude": 121.07368,
    "address": "San Jose, Pasig City, Metro Manila"
  },
  {
    "name": "San Jose Covered Court",
    "latitude": 14.560556,
    "longitude": 121.073056,
    "address": "San Jose, Pasig City, Metro Manila"
  },
  {
    "name": "San Miguel Elementary School",
    "latitude": 9.987778,
    "longitude": 124.341111,
    "address": "San Miguel, Pasig City, Metro Manila"
  },
  {
    "name": "San Miguel Covered Court",
    "latitude": 14.565556,
    "longitude": 121.085278,
    "address": "San Jose, Pasig City, Metro Manila"
  },
  {
    "name": "San Nicolas Covered Court",
    "latitude": 14.5622,
    "longitude": 121.0784,
    "address": "San Nicolas, Pasig City, Metro Manila"
  },
  {
    "name": "San Nicolas Barangay Hall",
    "latitude": 14.563056,
    "longitude": 121.078056,
    "address": "San Nicolas, Pasig City, Metro Manila"
  },
  {
    "name": "Santolan Barangay Hall",
    "latitude": 14.611944,
    "longitude": 121.086667,
    "address": "Santolan, Pasig City, Metro Manila"
  },
  {
    "name": "Santolan Ilaya Covered Court",
    "latitude": 14.616389,
    "longitude": 121.081389,
    "address": "Santolan, Pasig City, Metro Manila"
  },
  {
    "name": "Santa Cruz Barangay Hall",
    "latitude": 14.56392,
    "longitude": 121.07908,
    "address": "Santa Cruz, Pasig City, Metro Manila"
  },
  {
    "name": "Bliss Covered Court, Brgy. Sta. Lucia",
    "latitude": 14.578441962285753,
    "longitude": 121.1003710746114,
    "address": "731 E Bank Rd, Pasig City,  Metro Manila"
  },
  {
    "name": "Basket ball court",
    "latitude": 14.578991275587164,
    "longitude": 121.10113761127027,
    "address": "H4H2+GF9, Jacob St, Pasig City, Metro Manila"
  },
  {
    "name": "Soldiers Village Covered Court",
    "latitude": 14.577379036494602,
    "longitude": 121.10228547105531,
    "address": "93 M79 St, Pasig CIty, Metro Manila"
  },
  {
    "name": "Metrogreen Village, Covered court",
    "latitude": 14.577558920677642,
    "longitude": 121.10401517764832,
    "address": "H4G3+XJR, Metrogreen Dr, Pasig City, Metro Manila"
  },
  {
    "name": "Sta. Rosa Barangay Hall",
    "latitude": 14.559287958533435,
    "longitude": 121.07311802909044,
    "address": "H35F+J65, Lopez Jaena, Pasig City, Metro Manila"
  },
  {
    "name": "Barangay Sto.Tomas Basketball Court",
    "latitude": 14.564768267099517,
    "longitude": 121.07971618277695,
    "address": "59 M.H. del Pilar St, Pasig City, Metro Manila"
  },
  {
    "name": "Brgy. Sumilang Sports Center",
    "latitude": 14.555463981965403,
    "longitude": 121.07377765885806,
    "address": "63 Kalayaan Street, Pasig City, Metro Manila"
  },
  {
    "name": "4th floor, Ugong Brgy. Hall",
    "latitude": 14.57909682036413,
    "longitude": 121.07834886743566,
    "address": "154 F.Legaspi, Pasig City, Metro Manila"
  },
  {
    "name": "Ugong Covered Court",
    "latitude": 14.579061413692926,
    "longitude": 121.07845427015546,
    "address": "H3HH+H9G, Pasig City, Metro Manila"
  },
  {
    "name": "Ugong Covered Court, Purok 2",
    "latitude": 14.578782722931557,
    "longitude": 121.07954513258355,
    "address": "H3HH+FQ9, Pasig City, Metro Manila"
 },

  // Add more evacuation centers here
];


double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  final double distance = Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  return distance;
}

Future<Map<String, dynamic>> findNearestCenter() async {
  Position userLocation = await getUserLocation(); // Get user location first
  Map<String, dynamic>? nearestCenter;
  double nearestDistance = double.infinity;

  for (final center in evacuationCenters) {
    final double distance = calculateDistance(
      userLocation.latitude, userLocation.longitude, center['latitude'], center['longitude']);
    if (distance < nearestDistance) {
      nearestDistance = distance;
      nearestCenter = center;
    }
  }

  return Future.value(nearestCenter);
}

void launchGoogleMaps(double latitude, double longitude) async {
  Position userLocation = await getUserLocation(); // Get user location again
  final url = 'https://www.google.com/maps/dir/?api=1&origin=${userLocation.latitude},${userLocation.longitude}&destination=$latitude,$longitude&travelmode=driving';
  //if (await canLaunch(url)) {
    await launch(url);
  //} else {
    //throw 'Could not launch Google Maps';
  //}
}

class EvacScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: findNearestCenter(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final center = snapshot.data!;
          return Scaffold( 
            appBar: AppBar(
              title: Text('Nearest Evacuation Center'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context), 
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nearest Evacuation Center:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 5),
                      Text(center['name'] ?? "Unavailable"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.home),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          center['address'] ?? "Address unavailable",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => launchGoogleMaps(center['latitude'], center['longitude']),
                    child: Text('Get Directions in Google Maps'),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error finding location. Please try again later."),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

Future<Position> getUserLocation() async {
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  return position;
}