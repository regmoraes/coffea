import 'package:coffea/application/data/event.dart';
import 'package:coffea/recipe/model/method.dart';
import 'package:coffea/recipe/repository/method_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindMethods extends Cubit<Event<List<Method>>> {
  final MethodRepository methodRepository;

  FindMethods(this.methodRepository) : super(NotAsked());

  void findAll() async {
    final methods = await methodRepository.findAll();

    if (methods.isEmpty) {
      emit(Success(List.empty()));
    } else {
      emit(Success(methods));
    }
  }
}
