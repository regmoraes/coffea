import 'package:coffea/coffee/flavor.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<List<Flavor>> createScaaFlavorWheel() async {
  final scaaFlavorWheelJson = jsonDecode(
    await rootBundle.loadString('lib/assets/scaa-flavor-wheel.json'),
  );
  return List<Flavor>.from(
    scaaFlavorWheelJson.map(
      (flavorJson) => Flavor.fromJson(flavorJson),
    ),
  );
}
