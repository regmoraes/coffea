import 'dart:async';

import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/recipe/model/step.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _timerTickDuration = Duration(seconds: 1);

class MakeRecipe extends Cubit<RecipeState> {
  late Recipe _recipe;
  late Timer? _timer;
  var _currentStepIndex = 0;
  late Step _currentStep;

  MakeRecipe() : super(Ready());

  void start(Recipe recipe) {
    _recipe = recipe;
    _currentStepIndex = 0;
    _currentStep = _recipe.steps[_currentStepIndex];

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(_timerTickDuration, _onTimerTick);
  }

  void _onTimerTick(Timer timer) {
    final elapsedTimeInSeconds = timer.tick;

    if (elapsedTimeInSeconds >= _currentStep.duration.inSeconds) {
      _stopTimer();
      nextStep();
    } else {
      emit(
        Running(
          _currentStep,
          elapsedStepDuration: Duration(seconds: elapsedTimeInSeconds),
          remainingStepDuration: Duration(
            seconds: _currentStep.duration.inSeconds - elapsedTimeInSeconds,
          ),
        ),
      );
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void nextStep() {
    final recipeState = state;

    if (recipeState is Running) {
      if (recipeState.currentStep == _recipe.steps.last) {
        emit(Finished());
      } else {
        _currentStep = _recipe.steps[++_currentStepIndex];
        _startTimer();
      }
    }
  }

  void stop() {
    _stopTimer();
    emit(Finished());
  }
}

abstract class RecipeState {}

class Ready implements RecipeState {}

class Running implements RecipeState {
  final Step currentStep;
  final Duration elapsedStepDuration;
  final Duration remainingStepDuration;

  Running(
    this.currentStep, {
    required this.elapsedStepDuration,
    required this.remainingStepDuration,
  });
}

class Stopped implements RecipeState {
  final Step currentStep;

  Stopped(this.currentStep);
}

class Finished implements RecipeState {}
