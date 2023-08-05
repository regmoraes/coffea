import 'package:coffea/application/app.dart';
import 'package:coffea/application/module.dart';
import 'package:coffea/application/repository/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDatabase();

  runApp(ModularApp(module: CoffeaModule(), child: const CoffeaApp()));
}
