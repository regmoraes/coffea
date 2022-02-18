import 'dart:async';

import 'package:coffea/recipe/recipe.dart';
import 'package:coffea/recipe/step.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakeRecipe extends Cubit<RecipeState> {
  late Recipe _recipe;
  late int _currentStepIndex;
  late StreamSubscription<StepState> _currentStepSubscription;

  MakeRecipe() : super(Ready());

  void start(Recipe recipe) {
    _recipe = recipe;
    _currentStepIndex = 0;
    _currentStepSubscription = _recipe.steps.first.stream.listen(_onStepState);

    emit(Running(_recipe.steps.first..start()));
  }

  void nextStep() {
    final recipeState = state;

    if (recipeState is Running) {
      if (recipeState.currentStep == _recipe.steps.last) {
        emit(Finished());
      } else {
        final nextStep = _recipe.steps[_currentStepIndex++];
        _currentStepSubscription.cancel();
        _currentStepSubscription = nextStep.stream.listen(_onStepState);
        emit(Running(nextStep..start()));
      }
    }
  }

  void _onStepState(StepState stepState) {
    if (stepState is StepFinished) {
      nextStep();
    }
    if (stepState is StepStopped) {
      emit(Stopped(_recipe.steps[_currentStepIndex]));
    }
  }
}

abstract class RecipeState {}

class Ready implements RecipeState {}

class Running implements RecipeState {
  final Step currentStep;

  Running(this.currentStep);
}

class Stopped implements RecipeState {
  final Step currentStep;

  Stopped(this.currentStep);
}

class Finished implements RecipeState {}
