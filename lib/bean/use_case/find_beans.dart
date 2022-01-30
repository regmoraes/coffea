import 'package:coffea/bean/bean.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindBeans extends Cubit<FindBeansState> {
  final BeanRepository beanRepository;

  FindBeans(this.beanRepository) : super(FindBeansState());

  void findAll() async {
    final beans = await beanRepository.getBeans();

    if (beans.isEmpty) {
      emit(BeansNotFound());
    } else {
      emit(BeansFound(beans));
    }
  }
}

class FindBeansState {}

class BeansFound implements FindBeansState {
  final Set<Bean> beans;

  BeansFound(this.beans);
}

class BeansNotFound implements FindBeansState {
  BeansNotFound();
}
