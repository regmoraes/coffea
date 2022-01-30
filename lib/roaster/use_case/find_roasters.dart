import 'package:coffea/roaster/repository/local_repository.dart';
import 'package:coffea/roaster/roaster.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindRoasters extends Cubit<FindRoastersState> {
  final RoasterRepository roasterRepository;

  FindRoasters(this.roasterRepository) : super(FindRoastersState());

  void findAll() async {
    final roasters = await roasterRepository.findAll();

    if (roasters.isEmpty) {
      emit(RoastersNotFound());
    } else {
      emit(RoastersFound(roasters));
    }
  }
}

class FindRoastersState {}

class RoastersFound implements FindRoastersState {
  final Set<Roaster> roasters;

  RoastersFound(this.roasters);
}

class RoastersNotFound implements FindRoastersState {
  RoastersNotFound();
}
