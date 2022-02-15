import 'package:coffea/recipe/step.dart';

class StepBuilder {
  late String description;
  late Duration duration;

  Step build() => Step(description, duration);
}
