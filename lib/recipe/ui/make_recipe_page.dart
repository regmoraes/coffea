import 'package:coffea/recipe/model/recipe.dart';
import 'package:coffea/recipe/model/step.dart' as coffea;
import 'package:coffea/recipe/use_case/make_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MakeRecipePage extends StatefulWidget {
  final Recipe recipe;

  const MakeRecipePage(this.recipe, {Key? key}) : super(key: key);

  @override
  State<MakeRecipePage> createState() => _MakeRecipePageState();
}

class _MakeRecipePageState extends State<MakeRecipePage> {
  final MakeRecipe makeRecipe = Modular.get<MakeRecipe>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MakeRecipe, RecipeState>(
      bloc: makeRecipe,
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Recipe ${widget.recipe.name}'),
            actions: [
              state is Running
                  ? IconButton(
                icon: const Icon(Icons.stop),
                      onPressed: () => makeRecipe.stop(),
                    )
                  : IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () => makeRecipe.start(widget.recipe),
                    )
            ],
          ),
          body: Center(
            child: ListView.builder(
              itemCount: widget.recipe.steps.length,
              itemBuilder: (_, index) {
                final step = widget.recipe.steps[index];
                final recipeState = state;

                if (recipeState is Running && recipeState.currentStep == step) {
                  return RunningStepItem(recipeRunningState: recipeState);
                } else {
                  return StepItem(step: step);
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class StepItem extends StatelessWidget {
  final coffea.Step step;

  const StepItem({
    Key? key,
    required this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(step.description),
          Text('Duration ${step.duration}'),
        ],
      ),
    );
  }
}

class RunningStepItem extends StatelessWidget {
  final Running recipeRunningState;

  const RunningStepItem({
    Key? key,
    required this.recipeRunningState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.greenAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(recipeRunningState.currentStep.description),
          Text('Duration ${recipeRunningState.remainingStepDuration.inSeconds}')
        ],
      ),
    );
  }
}
