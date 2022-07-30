import 'package:coffea/application/repository.dart';
import 'package:coffea/bean/bean.dart';
import 'package:coffea/bean/roast.dart';
import 'package:coffea/method/method.dart';
import 'package:coffea/recipe/model/grind_size.dart';
import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/recipe/model/step.dart';
import 'package:coffea/roaster/roaster.dart';

final _recipes = <Recipe>[
  Recipe(
      name: 'Teste',
      method: Method('AeroPress'),
      bean: Bean(
        'Pa',
        roaster: Roaster('Fulano'),
        roast: const Roast('Medium'),
      ),
      grindSize: GrindSize('Medium'),
      ratio: 10 / 100,
      waterQuantity: 100,
      beanQuantity: 10,
      steps: [
        Step('moer', const Duration(seconds: 4)),
        Step('mexer', const Duration(seconds: 5)),
        Step('coar', const Duration(seconds: 7)),
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
