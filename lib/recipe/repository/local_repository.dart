import 'package:coffea/application/repository.dart';
import 'package:coffea/bean/bean.dart';
import 'package:coffea/bean/roast.dart';
import 'package:coffea/method/method.dart';
import 'package:coffea/recipe/grind_size.dart';
import 'package:coffea/recipe/recipe.dart';
import 'package:coffea/recipe/step.dart';
import 'package:coffea/roaster/roaster.dart';

final _recipes = <Recipe>[
  Recipe(
      name: 'Teste',
      method: Method('AeroPress'),
      bean: Bean(
        'Pa',
        roaster: Roaster('Fulano'),
        roast: Roast('Medium'),
      ),
      grindSize: GrindSize('Medium'),
      ratio: 0.1,
      waterQuantity: 100,
      beanQuantity: 10,
      steps: [
        Step('moer', Duration(seconds: 4)),
        Step('mexer', Duration(seconds: 5)),
        Step('coar', Duration(seconds: 7)),
      ],
      comments: 'Essa parada')
];

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
