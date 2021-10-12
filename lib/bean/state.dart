import 'package:coffea/bean/bean.dart';
import 'package:coffea/infrastructure/state.dart';

class BeanState {}

class AddBeanState extends State<Set<Bean>> with BeanState {
  AddBeanState({Set<Bean>? data, bool isLoading = false, Exception? error})
      : super(data, isLoading, error);
}

class GetBeansState extends State<Set<Bean>> with BeanState {
  GetBeansState({Set<Bean>? data, bool isLoading = false, Exception? error})
      : super(data, isLoading, error);
}
