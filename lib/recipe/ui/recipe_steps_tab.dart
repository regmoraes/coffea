import 'package:coffea/recipe/model/recipe_builder.dart';
import 'package:coffea/recipe/ui/new_recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecipeStepsTab extends StatefulWidget {
  final NewRecipeFormData formData;

  const RecipeStepsTab({Key? key, required this.formData})
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
          if (widget.formData.recipeBuilder.steps.isEmpty) ...[
            const Center(
              child: Text("Add new step"),
            )
          ] else ...[
            Expanded(
              child: ListView.builder(
                itemCount: widget.formData.recipeBuilder.steps.length,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  final step = widget.formData.recipeBuilder.steps[position];
                  return ListTile(leading: Text(step.description));
                },
              ),
            ),
          ],
          ElevatedButton(
            onPressed: () async {
              await Modular.to.pushNamed(
                '/recipes/steps',
                arguments: widget.formData.recipeBuilder,
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
