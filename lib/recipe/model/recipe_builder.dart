import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/grind_size.dart';
import 'package:coffea/recipe/model/method.dart';
import 'package:coffea/recipe/model/ratio_calculator.dart';
import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/recipe/model/step.dart';

class RecipeBuilder {
  String? name;
  Method? method;
  Bean? bean;
  GrindSize? grindSize;
  List<Step> steps = [];
  String? comments;

  final RatioCalculator ratioCalculator = RatioCalculator();

  Recipe build() {
    return Recipe()
      ..name = name!
      ..method.value = method!
      ..bean.value = bean!
      ..grindSize.value = grindSize!
      ..steps.addAll(steps)
      ..comments = comments
      ..ratio = ratioCalculator.ratio
      ..beanQuantity = ratioCalculator.beanQuantity
      ..waterQuantity = ratioCalculator.waterQuantity;
  }

  @override
  String toString() {
    return 'RecipeBuilder{name: $name, method: $method, bean: $bean, grindSize: $grindSize, steps: $steps, comments: $comments, ratioCalculator: $ratioCalculator}';
  }
}
