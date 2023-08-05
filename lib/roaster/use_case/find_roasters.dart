import 'package:coffea/roaster/repository/local_repository.dart';
import 'package:coffea/roaster/model/roaster.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetRoasters extends Cubit<List<Roaster>> {
  final RoasterRepository roasterRepository;

  GetRoasters(this.roasterRepository) : super(List.empty());

  void getAll() async {
    emit(await roasterRepository.findAll());
  }
}

