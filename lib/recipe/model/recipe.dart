import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/grind_size.dart';
import 'package:coffea/method/model/method.dart';
import 'package:coffea/recipe/model/ratio.dart';
import 'package:coffea/recipe/model/step.dart';

const defaultWaterQuantity = 100.0;
const defaultBeanQuantity = 10.0;

class Recipe {
  final Method method;
  final Bean bean;
  final GrindSize grindSize;
  final Ratio ratio;
  final List<Step> steps;
  final String? comments;

  late final Duration totalDuration;

  Recipe({
    required this.method,
    required this.bean,
    required this.grindSize,
    required this.ratio,
    required this.steps,
    required this.comments,
  }) {
    totalDuration = steps
        .map((step) => step.duration)
        .reduce((totalDuration, duration) => totalDuration + duration);
  }
}

class RecipeBuilder {
  Method? method;
  Bean? bean;
  GrindSize? grindSize;
  List<Step>? steps;
  String? comments;

  final Ratio ratio = Ratio();

  Recipe build() {
    return Recipe(
        method: method!,
        bean: bean!,
        grindSize: grindSize!,
        steps: steps!,
        comments: comments,
        ratio: ratio);
  }
}
