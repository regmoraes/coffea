import 'package:coffea/method/model/method.dart';
import 'package:coffea/method/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMethods extends Cubit<FindMethodsState> {
  final MethodRepository methodRepository;

  GetMethods(this.methodRepository) : super(FindMethodsState());

  void findAll() async {
    final methods = await methodRepository.getAll();

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
