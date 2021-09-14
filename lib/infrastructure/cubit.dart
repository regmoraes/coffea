import 'package:coffea/domain/bean.dart';
import 'package:coffea/domain/flavor.dart';
import 'package:coffea/infrastructure/cubit_state.dart';
import 'package:coffea/infrastructure/repository.dart' as repository;
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeaCubit extends Cubit<CoffeaState> {
  CoffeaCubit() : super(InitialState());

  void getBeans() async {
    final beans = await repository.getBeans();
    emit(BeansState(beans));
  }

  void getRoasts() async {
    final roasts = await repository.getRoasts();
    emit(RoastsState(roasts));
  }

  void getFlavors() async {
    final flavors = await repository.getFlavors(flatten: true);

    emit(FlavorsState(flavors));
  }

  void addBean(Bean bean) async {
    repository.addBean(bean);
    final updatedBeans = await repository.getBeans();
    emit(BeansState(updatedBeans, addedBean: bean));
  }
}