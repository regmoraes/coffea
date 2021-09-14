import 'package:coffea/app.dart';
import 'package:coffea/infrastructure/repository.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loadCoffeaData();
  runApp(const CoffeaApp());
}
