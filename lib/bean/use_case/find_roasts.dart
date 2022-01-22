import 'package:coffea/bean/model/roast.dart';
import 'package:coffea/bean/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindRoasts extends Cubit<FindRoastsState> {
  final BeanRepository beanRepository;

  FindRoasts(this.beanRepository) : super(FindRoastsState());

  void findAll() async {
    final roasts = await beanRepository.getRoasts();

    if (roasts.isEmpty) {
      emit(RoastsNotFound());
    } else {
      emit(RoastsFound(roasts));
    }
  }
}

class FindRoastsState {}

class RoastsFound implements FindRoastsState {
  final Set<Roast> roasts;

  RoastsFound(this.roasts);
}

class RoastsNotFound implements FindRoastsState {
  RoastsNotFound();
}
