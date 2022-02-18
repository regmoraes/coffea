import 'package:coffea/recipe/recipe.dart';
import 'package:coffea/recipe/step.dart' as coffea;
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
                      onPressed: () => state.currentStep.stop(),
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
                return StepItem(step: widget.recipe.steps[index]);
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
    return BlocConsumer<coffea.Step, coffea.StepState>(
      bloc: step,
      listener: (_, state) {
        if (state is coffea.StepFinished) {
          step.stop();
        }
      },
      builder: (_, state) {
        return Container(
          padding: EdgeInsets.all(16),
          color:
              state is coffea.StepRunning ? Colors.greenAccent : Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(step.description),
              state is coffea.StepRunning
                  ? Text('Duration ${state.remainingDuration.inSeconds}')
                  : Text('Duration ${step.duration.inSeconds}'),
            ],
          ),
        );
      },
    );
  }
}
