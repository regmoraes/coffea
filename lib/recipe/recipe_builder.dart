import 'package:coffea/bean/bean.dart';
import 'package:coffea/method/method.dart';
import 'package:coffea/recipe/bean_water_ratio.dart';
import 'package:coffea/recipe/grind_size.dart';
import 'package:coffea/recipe/recipe.dart';
import 'package:coffea/recipe/step.dart';

class RecipeBuilder {
  String? name;
  Method? method;
  Bean? bean;
  GrindSize? grindSize;
  List<Step> steps = [];
  String? comments;

  final BeanWaterRatio ratio = BeanWaterRatio();

  Recipe build() {
    return Recipe(
      name: name!,
      method: method!,
      bean: bean!,
      grindSize: grindSize!,
      steps: steps,
      comments: comments,
      ratio: ratio,
    );
  }
}
