import 'package:coffea/recipe/grind_size.dart';
import 'package:coffea/recipe/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindGrindSizes extends Cubit<FindGrindSizesState> {
  final RecipeRepository recipeRepository;

  FindGrindSizes(this.recipeRepository) : super(FindGrindSizesState());

  void findAll() async {
    final grindSizes = await recipeRepository.findAllGrindSize();

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
