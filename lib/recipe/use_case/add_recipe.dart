import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/recipe/repository/recipe_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRecipe extends Cubit<AddRecipeState> {
  final RecipeRepository recipeRepository;

  AddRecipe(this.recipeRepository) : super(AddRecipeState());

  void add(Recipe bean) async {
    await recipeRepository.addRecipe(bean);
    emit(RecipeAdded(bean));
  }
}

class AddRecipeState {}

class RecipeAdded implements AddRecipeState {
  final Recipe bean;

  RecipeAdded(this.bean);
}
