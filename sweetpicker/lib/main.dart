import 'package:flutter/material.dart';

import 'Screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: SplashScreen(),
    );
  }
}
