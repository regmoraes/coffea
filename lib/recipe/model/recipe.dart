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
  final List<Step> steps;
  final String? comments;

  late final Duration totalDuration;
  late Ratio ratio;

  Recipe({
    required this.method,
    required this.bean,
    required this.grindSize,
    required this.steps,
    this.comments,
  }) {
    totalDuration = steps
        .map((step) => step.duration)
        .reduce((totalDuration, duration) => totalDuration + duration);

    ratio = Ratio(
      beanQuantity: defaultBeanQuantity,
      waterQuantity: defaultWaterQuantity,
    );
  }

  set waterQuantity(quantity) {
    ratio.waterQuantity = quantity;
  }

  set beanQuantity(quantity) {
    ratio.beanQuantity = quantity;
  }
}
