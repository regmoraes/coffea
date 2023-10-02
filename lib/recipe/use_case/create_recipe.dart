import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/recipe/repository/recipe_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRecipe extends Cubit<AddRecipeState> {
  final RecipeRepository recipeRepository;

  CreateRecipe(this.recipeRepository) : super(AddRecipeState());

  Future<void> call(Recipe bean) async {
    await recipeRepository.save(bean);
    emit(RecipeAdded(bean));
  }
}

class AddRecipeState {}

class RecipeAdded implements AddRecipeState {
  final Recipe bean;

  RecipeAdded(this.bean);
}
