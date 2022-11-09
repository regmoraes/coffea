import 'package:coffea/application/app.dart';
import 'package:coffea/application/module.dart';
import 'package:coffea/bean/bean.dart';
import 'package:coffea/bean/flavor.dart';
import 'package:coffea/bean/roast.dart';
import 'package:coffea/method/method.dart';
import 'package:coffea/producer/producer.dart';
import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/roaster/roaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:isar/isar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Isar.open([
    RoasterSchema,
    ProducerSchema,
    FlavorSchema,
    RoastSchema,
    BeanSchema,
    MethodSchema,
    RecipeSchema,
  ]);

  runApp(ModularApp(module: CoffeaModule(), child: const CoffeaApp()));
}
