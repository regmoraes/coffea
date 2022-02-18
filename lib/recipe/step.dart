import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

const _timerTickDuration = Duration(seconds: 1);

class Step extends Cubit<StepState> {
  final String description;
  final Duration duration;
  Timer? _timer;

  Step(this.description, this.duration) : super(StepState());

  void start() {
    _timer ??= Timer.periodic(_timerTickDuration, _onTimerTick);
  }

  void stop() {
    if (state is StepRunning) {
      _stopTimer();
      emit(StepStopped(this));
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _onTimerTick(Timer timer) {
    final elapsedTimeInSeconds = timer.tick;

    if (elapsedTimeInSeconds == duration.inSeconds) {
      _stopTimer();
      emit(StepFinished(this));
    } else {
      emit(
        StepRunning(
          elapsedDuration: Duration(seconds: elapsedTimeInSeconds),
          remainingDuration: Duration(
            seconds: duration.inSeconds - elapsedTimeInSeconds,
          ),
        ),
      );
    }
  }
}

class StepState {}

class StepRunning implements StepState {
  final Duration elapsedDuration;
  final Duration remainingDuration;

  StepRunning({required this.elapsedDuration, required this.remainingDuration});
}

class StepFinished implements StepState {
  final Step step;

  StepFinished(this.step);
}

class StepStopped implements StepState {
  final Step step;

  StepStopped(this.step);
}
