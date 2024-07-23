import 'package:flutter/material.dart';
import 'package:flexi_bottom_nav/flexi_bottom_nav.dart'; 

void main() {
  runApp(const MaterialApp(
    home: FlexiBottomNavigation(
      screens: [
        Scaffold(body: Center(child: Text('Screen 1'))),
        Scaffold(body: Center(child: Text('Screen 2'))),
        Scaffold(body: Center(child: Text('Screen 3'))),
      ],
      labels: ['Home', 'Search', 'Profile'],
      icons: [Icons.home, Icons.search, Icons.person],
      iconColors: [Colors.blue, Colors.green, Colors.red],
      textSize: 14.0,
      iconSize: 30.0,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.blueGrey,
    ),
  ));
}