import 'package:coffea/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CoffeaApp());
}

class CoffeaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


