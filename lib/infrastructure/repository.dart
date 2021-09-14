import 'dart:convert';

import 'package:coffea/domain/bean.dart';
import 'package:coffea/domain/flavor.dart';
import 'package:coffea/domain/grind_size.dart';
import 'package:coffea/domain/method.dart';
import 'package:coffea/domain/roast.dart';
import 'package:flutter/services.dart' show rootBundle;

late Map<String, dynamic> _coffeaData;

var _beans = <Bean>{};

void loadCoffeaData() async {
  _coffeaData = jsonDecode(
    await rootBundle.loadString('lib/assets/coffea-data.json'),
  );
}

Future<List<Flavor>> getFlavors({bool flatten = false}) async {
  final flavors = List<Flavor>.from(
    _coffeaData["flavors"].map((flavorJson) => Flavor.fromJson(flavorJson)),
  );

  if(flatten) {
    return flattenDeep(flavors);
  } else {
    return flavors;
  }
}

Future<List<GrindSize>> getGrindSizes() async {
  return List<GrindSize>.from(
    _coffeaData["grind_sizes"].map((grindSize) => Roast.fromJson(grindSize)),
  );
}

Future<List<Roast>> getRoasts() async {
  return List<Roast>.from(
    _coffeaData["roasts"].map((roast) => Roast.fromJson(roast)),
  );
}


Future<void> addBean(Bean bean) async {
  _beans.add(bean);
}

Future<Set<Bean>> getBeans() async {
  return _beans;
}

Future<List<Method>> getMethods() async {
  return List<Method>.from(
    _coffeaData["methods"].map((method) => Method.fromJson(method)),
  );
}

List<Flavor> flattenDeep(Iterable<Flavor> flavors) => [
  for (var flavor in flavors)
    if (flavor.flavors?.isNotEmpty == true)
      ...flattenDeep(flavor.flavors!)
    else
      flavor
];
