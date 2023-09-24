import 'package:coffea/bean/model/grind_size.dart';
import 'package:coffea/bean/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindGrindSizes extends Cubit<FindGrindSizesState> {
  final BeanRepository beanRepository;

  FindGrindSizes(this.beanRepository) : super(FindGrindSizesState());

  void findAll() async {
    final grindSizes = await beanRepository.findGrindSizes();

    if (grindSizes.isEmpty) {
      emit(GrindSizesNotFound());
    } else {
      emit(GrindSizesFound(grindSizes));
    }
  }
}

class FindGrindSizesState {}

class GrindSizesFound implements FindGrindSizesState {
  final List<GrindSize> grindSizes;

  GrindSizesFound(this.grindSizes);
}

class GrindSizesNotFound implements FindGrindSizesState {
  GrindSizesNotFound();
}
