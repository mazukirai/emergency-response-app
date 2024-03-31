import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; 
import 'map.dart';
import 'evac.dart';
import 'button1.dart'; // fire button
import 'button2.dart'; // earthquake button
import 'button3.dart'; // flood button
import 'button4.dart'; // medical assistance button
import 'button5.dart'; // accidents button
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line
  await Permission.location.request(); // Request location permission
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EvacScreen()),
                );
              },
              child: Text('Find Near Evacuation Center'),
            ),
            SizedBox(height: 20),
            Divider(thickness: 1),
            SizedBox(height: 20),

            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ButtonOneScreen()),
                );
              },
                  child: Text('Fire'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ButtonTwoScreen()),
                );
              },
                  child: Text('Earthquake'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ButtonThreeScreen()),
                );
              },
                  child: Text('Flood'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ButtonFourScreen()),
                );
              },
                  child: Text('Medical Assistance'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ButtonFiveScreen()),
                );
              },
                  child: Text('Accidents'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(thickness: 1),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationScreen()),
              ),
              child: Text('Map'),
            ),
          ],
        ),
      ),
    );
  }
}
