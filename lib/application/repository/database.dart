import 'dart:convert';

import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/flavor.dart';
import 'package:coffea/bean/model/roast.dart';
import 'package:coffea/method/model/method.dart';
import 'package:coffea/producer/model/producer.dart';
import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/roaster/model/roaster.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initializeDatabase() async {
  final databaseDir = await getApplicationDocumentsDirectory();

  final database = await Isar.open(
    [
      RoasterSchema,
      ProducerSchema,
      FlavorSchema,
      RoastSchema,
      BeanSchema,
      MethodSchema,
      RecipeSchema,
    ],
    directory: databaseDir.path,
  );

  final jsonData = await _getCoffeaJsonData();

  await _loadRoastData(database, jsonData);
  await _loadFlavorsData(database, jsonData);
}

Future<Map<String, dynamic>> _getCoffeaJsonData() async {
  String data = await rootBundle.loadString('lib/application/assets/coffea-data.json');
  return jsonDecode(data);
}

Future<void> _loadRoastData(Isar database, Map<String, dynamic> jsonData) async {
  await database.writeTxn(() async {
    database.collection<Roast>().importJson(List.from(jsonData['roasts']));
  });
}

Future<void> _loadFlavorsData(Isar database, Map<String, dynamic> jsonData) async {
  await database.writeTxn(() async {
    database.collection<Roast>().importJson(List.from(jsonData['flavors']));
  });
}
