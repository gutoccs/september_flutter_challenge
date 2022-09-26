import 'package:flutter/material.dart';

import 'package:september_flutter_challenge/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenge',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
      },
    );
  }
}
