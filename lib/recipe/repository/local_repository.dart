import 'package:coffea/application/repository.dart';
import 'package:coffea/recipe/grind_size.dart';
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

  Future<List<GrindSize>> findAllGrindSize() async {
    return List.from(
      coffeaData["grind_sizes"].map(
        (grindSize) => GrindSize.fromJson(grindSize),
      ),
    );
  }
}
