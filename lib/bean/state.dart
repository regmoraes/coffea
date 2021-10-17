import 'package:coffea/bean/bean.dart';
import 'package:coffea/bean/flavor.dart';
import 'package:coffea/bean/roast.dart';
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

class GetFlavorsState extends State<List<Flavor>> with BeanState {
  GetFlavorsState(
      {List<Flavor>? data, bool isLoading = false, Exception? error})
      : super(data, isLoading, error);
}

class GetRoastsState extends State<List<Roast>> with BeanState {
  GetRoastsState({List<Roast>? data, bool isLoading = false, Exception? error})
      : super(data, isLoading, error);
}
