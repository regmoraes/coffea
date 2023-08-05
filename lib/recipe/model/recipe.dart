import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/method/model/method.dart';
import 'package:coffea/recipe/model/grind_size.dart';
import 'package:coffea/recipe/model/step.dart';
import 'package:isar/isar.dart';

part 'recipe.g.dart';

@collection
class Recipe {
  Id id = Isar.autoIncrement;

  late String name;

  final method = IsarLink<Method>();

  final bean = IsarLink<Bean>();

  late GrindSize grindSize;

  late double ratio;

  late double waterQuantity;

  late double beanQuantity;

  final steps = List<Step>.empty(growable: true);

  late String? comments;

  @ignore
  late final Duration totalDuration;

  Recipe() {
    totalDuration = steps.map((step) => step.duration).fold(
          const Duration(seconds: 0),
          (totalDuration, duration) => totalDuration + Duration(seconds: duration),
        );
  }
}
