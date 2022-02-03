import 'package:coffea/recipe/recipe.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;

  const RecipePage(this.recipe, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Column(
        children: [
          Text(recipe.method.name),
          Text(recipe.bean.name),
          Text(recipe.grindSize.size),
          Text(recipe.ratio.ratioFormatted),
          Text(recipe.comments ?? ''),
          Text('${recipe.totalDuration}'),
        ],
      ),
    );
  }
}
