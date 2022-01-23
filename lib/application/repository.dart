import 'dart:convert';

import 'package:flutter/services.dart';

late Map<String, dynamic> coffeaData;

void loadCoffeaData() async {
  coffeaData = jsonDecode(
    await rootBundle.loadString('lib/assets/coffea-data.json'),
  );
}
