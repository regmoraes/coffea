import 'package:coffea/recipe/model/ratio_calculator.dart';
import 'package:coffea/recipe/model/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;

  const RecipePage(this.recipe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Column(
        children: [
          Text('Método: ${recipe.method.value?.name}'),
          Text('Nome: ${recipe.bean.value?.name}'),
          Text('Tamanho: ${recipe.grindSize.size}'),
          Text('Proporção: ${recipe.ratio.formattedAsRatio()}'),
          Text('Grão (g): ${recipe.beanQuantity.formattedAsGrams()}'),
          Text('Quantidade de água: ${recipe.waterQuantity.formattedAsMl()}'),
          Text('Comentários: ${recipe.comments ?? ''}'),
          Text('Duração ${recipe.totalDuration}'),
          ElevatedButton(
            child: const Text('Start'),
            onPressed: () {
              Modular.to.pushNamed('/recipes/make', arguments: recipe);
            },
          ),
        ],
      ),
    );
  }
}
