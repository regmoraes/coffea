import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoffeaApp extends StatelessWidget {
  const CoffeaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular(); //added by extension
  }
}
