import 'dart:convert';

import 'package:coffea/bean/bean.dart';
import 'package:coffea/bean/flavor.dart';
import 'package:coffea/bean/roast.dart';
import 'package:flutter/services.dart';

class BeanRepository {
  final _beans = <Bean>{};

  BeanRepository() {
    loadCoffeaData();
  }

  Future<void> addBean(Bean bean) async {
    _beans.add(bean);
  }

  Future<Set<Bean>> getBeans() async {
    return _beans;
  }

  late Map<String, dynamic> _coffeaData;

  void loadCoffeaData() async {
    _coffeaData = jsonDecode(
      await rootBundle.loadString('lib/assets/coffea-data.json'),
    );
  }

  Future<List<Flavor>> getFlavors({bool flatten = false}) async {
    final flavors = List<Flavor>.from(
      _coffeaData["flavors"].map((flavorJson) => Flavor.fromJson(flavorJson)),
    );

    if (flatten) {
      return flattenDeep(flavors);
    } else {
      return flavors;
    }
  }

  Future<List<Roast>> getRoasts() async {
    return List<Roast>.from(
      _coffeaData["roasts"].map((roast) => Roast.fromJson(roast)),
    );
  }

  List<Flavor> flattenDeep(Iterable<Flavor> flavors) => [
        for (var flavor in flavors)
          if (flavor.flavors?.isNotEmpty == true)
            ...flattenDeep(flavor.flavors!)
          else
            flavor
      ];
}
