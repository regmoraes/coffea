import 'package:coffea/recipe/model/recipe_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecipeStepsTab extends StatefulWidget {
  final RecipeBuilder recipeBuilder;

  const RecipeStepsTab({Key? key, required this.recipeBuilder})
      : super(key: key);

  @override
  RecipeStepsTabState createState() => RecipeStepsTabState();
}

class RecipeStepsTabState extends State<RecipeStepsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.recipeBuilder.steps.isEmpty) ...[
            const Center(
              child: Text("Add new step"),
            )
          ] else ...[
            Expanded(
              child: ListView.builder(
                itemCount: widget.recipeBuilder.steps.length,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  final step = widget.recipeBuilder.steps[position];
                  return ListTile(leading: Text(step.description));
                },
              ),
            ),
          ],
          ElevatedButton(
            onPressed: () async {
              await Modular.to.pushNamed(
                '/recipes/steps',
                arguments: widget.recipeBuilder,
              );
              setState(() {});
            },
            child: const Text('Add Step'),
          )
        ],
      ),
    );
  }
}
