import 'package:coffea/bean/bean.dart';
import 'package:coffea/bean/repository.dart';
import 'package:coffea/bean/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeanCubit extends Cubit<BeanState> {
  final BeanRepository beanRepository;

  BeanCubit(this.beanRepository) : super(BeanState());

  void addBean(Bean bean) async {
    emit(AddBeanState(isLoading: true));

    await beanRepository.addBean(bean);
    final updatedBeans = await beanRepository.getBeans();

    emit(AddBeanState(data: updatedBeans));
  }

  void getBeans() async {
    emit(GetBeansState(isLoading: true));

    final beans = await beanRepository.getBeans();

    emit(GetBeansState(data: beans));
  }

  void getRoasts() async {
    final roasts = await beanRepository.getRoasts();

    emit(GetRoastsState(data: roasts));
  }

  void getFlavors() async {
    final flavors = await beanRepository.getFlavors(flatten: true);

    emit(GetFlavorsState(data: flavors));
  }
}
