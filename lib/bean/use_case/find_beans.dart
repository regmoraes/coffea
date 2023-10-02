import 'package:coffea/application/data/event.dart';
import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindBeans extends Cubit<Event<List<Bean>>> {
  final BeanRepository beanRepository;

  FindBeans(this.beanRepository) : super(NotAsked());

  void findAll() async {
    final beans = await beanRepository.findBeans();

    emit(Success(beans));
  }
}
