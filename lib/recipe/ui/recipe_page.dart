import 'package:coffea/recipe/recipe.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;

  const RecipePage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(recipe.method.name),
          Text(recipe.grindSize.size),
          Text('$recipe.totalDuration'),
        ],
      ),
    );
  }
}
