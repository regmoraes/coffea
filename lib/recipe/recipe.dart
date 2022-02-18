import 'package:coffea/bean/bean.dart';
import 'package:coffea/method/method.dart';
import 'package:coffea/recipe/grind_size.dart';
import 'package:coffea/recipe/step.dart';

class Recipe {
  final String name;
  final Method method;
  final Bean bean;
  final GrindSize grindSize;
  final double ratio;
  final double waterQuantity;
  final double beanQuantity;
  final List<Step> steps;
  final String? comments;

  late final Duration totalDuration;

  Recipe({
    required this.name,
    required this.method,
    required this.bean,
    required this.grindSize,
    required this.ratio,
    required this.waterQuantity,
    required this.beanQuantity,
    required this.steps,
    required this.comments,
  }) {
    totalDuration = steps.map((step) => step.duration).fold(
          const Duration(seconds: 0),
          (totalDuration, duration) => totalDuration + duration,
        );
  }
}
