import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoffeaApp extends StatelessWidget {
  const CoffeaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Coffea',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
    );
  }
}
