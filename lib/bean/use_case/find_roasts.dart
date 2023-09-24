import 'package:coffea/bean/model/roast.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindRoasts extends Cubit<GetRoastsState> {
  final BeanRepository beanRepository;

  FindRoasts(this.beanRepository) : super(GetRoastsState());

  void findAll() async {
    final roasts = await beanRepository.findRoasts();

    if (roasts.isEmpty) {
      emit(RoastsNotFound());
    } else {
      emit(RoastsFound(roasts));
    }
  }
}

class GetRoastsState {}

class RoastsFound implements GetRoastsState {
  final List<Roast> roasts;

  RoastsFound(this.roasts);
}

class RoastsNotFound implements GetRoastsState {
  RoastsNotFound();
}
