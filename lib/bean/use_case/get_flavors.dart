import 'package:coffea/bean/flavor.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFlavors extends Cubit<FindFlavorsState> {
  final BeanRepository beanRepository;

  GetFlavors(this.beanRepository) : super(FindFlavorsState());

  void getAll() async {
    final flavors = await beanRepository.findFlavors();
    _emit(flavors);
  }

  void getAllFlatten() async {
    final flavors = await beanRepository.findFlavors();
    _emit(_flattenDeep(flavors));
  }

  void _emit(List<Flavor> flavors) {
    if (flavors.isEmpty) {
      emit(FlavorsNotFound());
    } else {
      emit(FlavorsFound(flavors));
    }
  }

  List<Flavor> _flattenDeep(List<Flavor> flavors) {
    return [
      for (var flavor in flavors)
        if (flavor.flavors.toList().isNotEmpty == true) ..._flattenDeep(flavor.flavors.toList()) else flavor
    ];
  }
}

class FindFlavorsState {}

class FlavorsFound implements FindFlavorsState {
  final List<Flavor> flavors;

  FlavorsFound(this.flavors);
}

class FlavorsNotFound implements FindFlavorsState {
  FlavorsNotFound();
}
