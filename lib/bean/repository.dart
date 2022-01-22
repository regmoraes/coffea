import 'dart:convert';

import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/flavor.dart';
import 'package:coffea/bean/model/roast.dart';
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

  Future<Set<Flavor>> getFlavors() async {
    return Set<Flavor>.from(
      _coffeaData["flavors"].map((flavorJson) => Flavor.fromJson(flavorJson)),
    );
  }

  Future<Set<Roast>> getRoasts() async {
    return Set<Roast>.from(
      _coffeaData["roasts"].map((roast) => Roast.fromJson(roast)),
    );
  }
}
