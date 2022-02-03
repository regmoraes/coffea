import 'package:coffea/bean/bean.dart';
import 'package:coffea/method/method.dart';
import 'package:coffea/recipe/bean_water_ratio.dart';
import 'package:coffea/recipe/grind_size.dart';
import 'package:coffea/recipe/step.dart';

class Recipe {
  final String name;
  final Method method;
  final Bean bean;
  final GrindSize grindSize;
  final BeanWaterRatio ratio;
  final List<Step> steps;
  final String? comments;

  late final Duration totalDuration;

  Recipe({
    required this.name,
    required this.method,
    required this.bean,
    required this.grindSize,
    required this.ratio,
    required this.steps,
    required this.comments,
  }) {
    totalDuration = steps.map((step) => step.duration).fold(
        const Duration(seconds: 0),
        (totalDuration, duration) => totalDuration + duration);
  }
}

class RecipeBuilder {
  String? name;
  Method? method;
  Bean? bean;
  GrindSize? grindSize;
  List<Step>? steps;
  String? comments;

  final BeanWaterRatio ratio = BeanWaterRatio();

  Recipe build() {
    return Recipe(
      name: name!,
      method: method!,
      bean: bean!,
      grindSize: grindSize!,
      steps: steps ?? List.empty(),
      //TODO create page for steps creation
      comments: comments,
      ratio: ratio,
    );
  }
}
