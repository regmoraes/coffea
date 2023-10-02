import 'package:coffea/application/data/event.dart';
import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBean extends Cubit<Event<Bean>> {
  final BeanRepository beanRepository;

  AddBean(this.beanRepository) : super(NotAsked());

  void add(Bean bean) async {
    emit(Loading());
    await beanRepository.save(bean);
    emit(Success(bean));
  }
}
