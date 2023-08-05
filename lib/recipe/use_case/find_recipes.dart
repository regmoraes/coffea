import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/recipe/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetRecipes extends Cubit<FindRecipesState> {
  final RecipeRepository recipeRepository;

  GetRecipes(this.recipeRepository) : super(FindRecipesState());

  void getAll() async {
    final recipes = await recipeRepository.findAll();

    if (recipes.isEmpty) {
      emit(RecipesNotFound());
    } else {
      emit(RecipesFound(recipes));
    }
  }

  void findAllByBean(Bean bean) async {
    final recipes = await recipeRepository.findAllByBean(bean);

    if (recipes.isEmpty) {
      emit(RecipesNotFound());
    } else {
      emit(RecipesFound(recipes));
    }
  }
}

class FindRecipesState {}

class RecipesFound implements FindRecipesState {
  final List<Recipe> recipes;

  RecipesFound(this.recipes);
}

class RecipesNotFound implements FindRecipesState {
  RecipesNotFound();
}
