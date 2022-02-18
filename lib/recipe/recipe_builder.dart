import 'package:coffea/bean/bean.dart';
import 'package:coffea/method/method.dart';
import 'package:coffea/recipe/grind_size.dart';
import 'package:coffea/recipe/ratio_calculator.dart';
import 'package:coffea/recipe/recipe.dart';
import 'package:coffea/recipe/step.dart';

class RecipeBuilder {
  String? name;
  Method? method;
  Bean? bean;
  GrindSize? grindSize;
  List<Step> steps = [];
  String? comments;

  final RatioCalculator ratioCalculator = RatioCalculator();

  Recipe build() {
    return Recipe(
      name: name!,
      method: method!,
      bean: bean!,
      grindSize: grindSize!,
      steps: steps,
      comments: comments,
      ratio: ratioCalculator.ratio,
      beanQuantity: ratioCalculator.beanQuantity,
      waterQuantity: ratioCalculator.waterQuantity,
    );
  }

  @override
  String toString() {
    return 'RecipeBuilder{name: $name, method: $method, bean: $bean, grindSize: $grindSize, steps: $steps, comments: $comments, ratioCalculator: $ratioCalculator}';
  }
}
