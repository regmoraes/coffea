import 'package:coffea/infrastructure/cubit_state.dart';
import 'package:coffea/infrastructure/repository.dart' as repository;
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeaCubit extends Cubit<CoffeaState> {
  CoffeaCubit() : super(InitialState());

  void getRoasts() async {
    final roasts = await repository.getRoasts();
    emit(RoastsState(roasts));
  }

  void getFlavors() async {
    final flavors = await repository.getFlavors(flatten: true);

    emit(FlavorsState(flavors));
  }
}