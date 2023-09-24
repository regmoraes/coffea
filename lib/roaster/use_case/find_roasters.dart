import 'package:coffea/roaster/repository/local_repository.dart';
import 'package:coffea/roaster/model/roaster.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindRoasters extends Cubit<List<Roaster>> {
  final RoasterRepository roasterRepository;

  FindRoasters(this.roasterRepository) : super(List.empty());

  void findAll() async {
    emit(await roasterRepository.findAll());
  }
}

