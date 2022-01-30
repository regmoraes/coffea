import 'package:coffea/recipe/recipe.dart';

final _recipes = List<Recipe>.empty();

class RecipeRepository {
  Future<List<Recipe>> findAll() async {
    return _recipes;
  }

  Future<List<Recipe>> findAllByBean(String beanName) async {
    return _recipes.where((recipe) => recipe.bean.name == beanName).toList();
  }

  addRecipe(Recipe recipe) {
    _recipes.add(recipe);
  }
}
