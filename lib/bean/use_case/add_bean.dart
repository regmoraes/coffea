import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBean extends Cubit<AddBeanState> {
  final BeanRepository beanRepository;

  AddBean(this.beanRepository) : super(AddBeanState());

  void add(Bean bean) async {
    await beanRepository.addBean(bean);
    emit(BeanAdded(bean));
  }
}

class AddBeanState {}

class BeanAdded implements AddBeanState {
  final Bean bean;

  BeanAdded(this.bean);
}
