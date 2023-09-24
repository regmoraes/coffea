import 'dart:convert';

import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/flavor.dart';
import 'package:coffea/bean/model/roast.dart';
import 'package:coffea/recipe/model/method.dart';
import 'package:coffea/producer/model/producer.dart';
import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/roaster/model/roaster.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../bean/model/grind_size.dart';

Future<void> initializeDatabase() async {
  final databaseDir = await getApplicationDocumentsDirectory();

  final database = await Isar.open(
    [
      BeanSchema,
      FlavorSchema,
      GrindSizeSchema,
      MethodSchema,
      ProducerSchema,
      RecipeSchema,
      RoasterSchema,
      RoastSchema,
    ],
    directory: databaseDir.path,
  );

  final jsonData = await _getCoffeaJsonData();

  await _loadFlavorsData(database, jsonData);
  await _loadGrindSizeData(database, jsonData);
  await _loadMethodsData(database, jsonData);
  await _loadRoastData(database, jsonData);
}

Future<Map<String, dynamic>> _getCoffeaJsonData() async {
  String data = await rootBundle.loadString('lib/application/assets/coffea-data.json');
  return jsonDecode(data);
}


Future<void> _loadFlavorsData(Isar database, Map<String, dynamic> jsonData) async {
  await database.writeTxn(() async {
    database.collection<Roast>().importJson(List.from(jsonData['flavors']));
  });
}

Future<void> _loadGrindSizeData(Isar database, Map<String, dynamic> jsonData) async {
  await database.writeTxn(() async {
    database.collection<GrindSize>().importJson(List.from(jsonData['grind_sizes']));
  });
}

Future<void> _loadMethodsData(Isar database, Map<String, dynamic> jsonData) async {
  await database.writeTxn(() async {
    database.collection<Method>().importJson(List.from(jsonData['methods']));
  });
}

Future<void> _loadRoastData(Isar database, Map<String, dynamic> jsonData) async {
  await database.writeTxn(() async {
    database.collection<Roast>().importJson(List.from(jsonData['roasts']));
  });
}
