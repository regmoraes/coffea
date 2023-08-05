import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/recipe/model/recipe.dart';
import 'package:isar/isar.dart';

class RecipeRepository {
  final Isar database;

  RecipeRepository(this.database);

  Future<List<Recipe>> findAll() {
    return database.recipes.where().findAll();
  }

  Future<List<Recipe>> findAllByBean(Bean bean) async {
    return database.recipes.where().filter().bean((query) => query.idEqualTo(bean.id)).findAll();
  }

  Future<int> addRecipe(Recipe recipe) {
    return database.recipes.put(recipe);
  }
}
