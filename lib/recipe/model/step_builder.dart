import 'package:coffea/recipe/model/step.dart';

class StepBuilder {
  late String description;
  late Duration duration;

  Step build() => Step()
    ..description = description
    ..duration = duration.inSeconds;
}
