import 'package:coffea/roaster/repository/local_repository.dart';
import 'package:coffea/roaster/roaster.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRoaster extends Cubit<AddRoasterState> {
  final RoasterRepository roasterRepository;

  AddRoaster(this.roasterRepository) : super(AddRoasterState());

  void add(Roaster roaster) async {
    await roasterRepository.addRoaster(roaster);
    emit(RoasterAdded(roaster));
  }
}

class AddRoasterState {}

class RoasterAdded implements AddRoasterState {
  final Roaster roaster;

  RoasterAdded(this.roaster);
}
