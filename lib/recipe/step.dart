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
    if (state is Running) {
      _timer?.cancel();
      _timer = null;
      emit(Stopped());
    }
  }

  void _onTimerTick(Timer timer) {
    final elapsedTimeInSeconds = timer.tick;

    if (elapsedTimeInSeconds == duration.inSeconds) {
      stop();
      emit(Finished());
    } else {
      emit(
        Running(
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

class Running implements StepState {
  final Duration elapsedDuration;
  final Duration remainingDuration;

  Running({required this.elapsedDuration, required this.remainingDuration});
}

class Finished implements StepState {}

class Stopped implements StepState {}
