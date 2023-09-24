import 'package:coffea/recipe/model/method.dart';
import 'package:coffea/recipe/repository/method_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindMethods extends Cubit<FindMethodsState> {
  final MethodRepository methodRepository;

  FindMethods(this.methodRepository) : super(FindMethodsState());

  void findAll() async {
    final methods = await methodRepository.findAll();

    if (methods.isEmpty) {
      emit(MethodsNotFound());
    } else {
      emit(MethodsFound(methods));
    }
  }
}

class FindMethodsState {}

class MethodsFound implements FindMethodsState {
  final List<Method> methods;

  MethodsFound(this.methods);
}

class MethodsNotFound implements FindMethodsState {
  MethodsNotFound();
}
