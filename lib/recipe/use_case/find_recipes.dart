import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/recipe/repository/local_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindRecipes extends Cubit<FindRecipesState> {
  final RecipeRepository recipeRepository;

  FindRecipes(this.recipeRepository) : super(FindRecipesState());

  void findAll() async {
    final recipes = await recipeRepository.findAll();

    if (recipes.isEmpty) {
      emit(RecipesNotFound());
    } else {
      emit(RecipesFound(recipes));
    }
  }

  void findAllByBean(String beanName) async {
    final recipes = await recipeRepository.findAllByBean(beanName);

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
