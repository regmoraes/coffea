import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetBeans extends Cubit<FindBeansState> {
  final BeanRepository beanRepository;

  GetBeans(this.beanRepository) : super(FindBeansState());

  void getAll() async {
    final beans = await beanRepository.findBeans();

    if (beans.isEmpty) {
      emit(BeansNotFound());
    } else {
      emit(BeansFound(beans));
    }
  }
}

class FindBeansState {}

class BeansFound implements FindBeansState {
  final List<Bean> beans;

  BeansFound(this.beans);
}

class BeansNotFound implements FindBeansState {
  BeansNotFound();
}
